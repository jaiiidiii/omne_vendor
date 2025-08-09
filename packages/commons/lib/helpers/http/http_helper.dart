// ignore_for_file: avoid_annotating_with_dynamic

import 'package:commons/helpers/http/entities/http_response.dart';
import 'package:commons/helpers/http/entities/http_response_error.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HttpHelper {
  void init();

  void changeBaseUrl(String baseUrl);

  String getBaseUrl();

  Future<Either<HttpResponseError, HttpResponse>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool noCache = false,
  });

  Future<Either<HttpResponseError, HttpResponse>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool retryOnTokenExpired = true,
  });

  Future<Either<HttpResponseError, HttpResponse>> postImages(
    String path, {
    required Map<String, dynamic> data,
    required FilesData filesData,
  });

  Future<Either<HttpResponseError, HttpResponse>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<HttpResponseError, HttpResponse>> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Stream<HttpResponseError> errorStream();

  void dispose();
}

class MultipartFileData {
  MultipartFileData({required this.path, required this.filename});

  final String path, filename;
}

class FilesData {
  FilesData({required this.files, this.filesNameParameter = 'file[]'});

  final List<MultipartFileData> files;
  final String filesNameParameter;
}
