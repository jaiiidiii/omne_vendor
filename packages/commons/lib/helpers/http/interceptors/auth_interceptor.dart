import 'dart:developer';

import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.requestInterceptionData});

  final Map<String, dynamic> Function(Map<String, dynamic> header) requestInterceptionData;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = requestInterceptionData(options.headers);
    super.onRequest(options, handler);
    log('URL: ${options.uri}');
    log('Header: ${options.headers}');
    log('Request: ${options.data}');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    log('Response: ${response.data}');
  }
}
