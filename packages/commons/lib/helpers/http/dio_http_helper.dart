// ignore_for_file: avoid_annotating_with_dynamic

import 'dart:async';
import 'dart:developer';

import 'package:commons/helpers/http/entities/http_response.dart';
import 'package:commons/helpers/http/entities/http_response_error.dart';
import 'package:commons/helpers/http/http_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

typedef OnRefreshTokenCallback = Future<bool> Function();
typedef IsExpiredTokenCheckCallback = bool Function(
    int errorStatusCode, String? message);

class DioHttpHelper implements HttpHelper {
  DioHttpHelper({
    required this.baseUrl,
    required this.onRefreshToken,
    required this.isExpiredToken,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.interceptors,
  });

  final String baseUrl;
  final OnRefreshTokenCallback onRefreshToken;
  final IsExpiredTokenCheckCallback isExpiredToken;
  late Dio _dio;
  final int connectTimeout, receiveTimeout;
  final List<Interceptor> interceptors;

  @override
  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: connectTimeout),
        receiveTimeout: Duration(seconds: receiveTimeout),
      ),
    )..interceptors.addAll(interceptors);
  }

  @override
  Future<Either<HttpResponseError, HttpResponse>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool noCache = false,
  }) async {
    try {
      final noCacheHeader = Options(headers: {'Cache-Control': 'no-cache'});
      final dioResponse = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: noCache ? noCacheHeader : null,
      );

      return Right(HttpResponse(
          data: dioResponse.data, statusCode: dioResponse.statusCode));
    } on DioError catch (error) {
      return _onDioError(
        error: error,
        onRetry: () =>
            get(path, noCache: noCache, queryParameters: queryParameters),
      );
    }
  }

  @override
  Future<Either<HttpResponseError, HttpResponse>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool retryOnTokenExpired = true,
  }) async {
    try {
      final dioResponse = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return Right(HttpResponse(
          data: dioResponse.data, statusCode: dioResponse.statusCode));
    } on DioError catch (error) {
      return _onDioError(
        error: error,
        onRetry: () async {
          if (!retryOnTokenExpired) {
            return post(path,
                data: data, queryParameters: queryParameters, options: options);
          }
          return Left(_buildResponseError(error));
        },
      );
    }
  }

  @override
  Future<Either<HttpResponseError, HttpResponse>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final dioResponse =
          await _dio.put(path, data: data, queryParameters: queryParameters);

      return Right(HttpResponse(
          statusCode: dioResponse.statusCode, data: dioResponse.data));
    } on DioError catch (error) {
      return _onDioError(
        error: error,
        onRetry: () => put(path, data: data, queryParameters: queryParameters),
      );
    }
  }

  @override
  Future<Either<HttpResponseError, HttpResponse>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    try {
      final dioResponse =
          await _dio.delete(path, queryParameters: queryParameters, data: data);
      return Right(HttpResponse(
          statusCode: dioResponse.statusCode, data: dioResponse.data));
    } on DioError catch (error) {
      return _onDioError(
        error: error,
        onRetry: () =>
            delete(path, data: data, queryParameters: queryParameters),
      );
    }
  }

  @override
  Future<Either<HttpResponseError, HttpResponse>> postImages(
    String path, {
    required Map<String, dynamic> data,
    required FilesData filesData,
  }) async {
    try {
      final multipartFiles = await Future.wait(
        filesData.files.map((file) async =>
            MultipartFile.fromFile(file.path, filename: file.filename)),
      );
      final formData = FormData.fromMap(
        {
          filesData.filesNameParameter: multipartFiles,
          ...data,
        },
      );
      final dioResponse = await _dio.post(
        path,
        data: formData,
      );
      return Right(HttpResponse(
          data: dioResponse.data, statusCode: dioResponse.statusCode));
    } on DioError catch (error) {
      return _onDioError(
        error: error,
        onRetry: () => postImages(path, data: data, filesData: filesData),
      );
    }
  }

  Future<Either<HttpResponseError, HttpResponse>> _onDioError({
    required DioError error,
    required Future<Either<HttpResponseError, HttpResponse>> Function() onRetry,
  }) async {
    final httpResponseError = _buildResponseError(error);
    if (isExpiredToken(
        httpResponseError.statusCode, httpResponseError.message)) {
      final refreshTokenSuccess = await onRefreshToken();
      if (refreshTokenSuccess) return onRetry();
    }
    _broadcastError(httpResponseError);

    log('Response status code:  ${httpResponseError.statusCode}');
    log('Response message: ${httpResponseError.message}');
    return Left(httpResponseError);
  }

  HttpResponseError _buildResponseError(DioError error) {
    final data = error.response?.data;
    return HttpResponseError(
      message: data is Map<String, dynamic>
          ? data['errorMessage'] ?? data['message']
          : data,
      stackTrace: error.stackTrace,
      statusCode: error.response?.statusCode,
      errorType: const ErrorType.error(),
    );
  }

  void _broadcastError(HttpResponseError error) =>
      _errorStreamController.add(error);

  final _errorStreamController =
      StreamController<HttpResponseError>.broadcast();

  @override
  Stream<HttpResponseError> errorStream() => _errorStreamController.stream;

  @override
  void dispose() => _errorStreamController.close();

  @override
  void changeBaseUrl(String baseUrl) => _dio.options.baseUrl = baseUrl;

  @override
  String getBaseUrl() => _dio.options.baseUrl;
}
