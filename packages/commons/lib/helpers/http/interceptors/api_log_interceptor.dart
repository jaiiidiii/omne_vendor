import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:commons/commons.dart';
import 'package:commons/helpers/http/entities/api_log_call.dart';
import 'package:commons/helpers/http/entities/api_log_data.dart';
import 'package:dio/dio.dart';

class ApiLogInterceptor extends Interceptor {
  ApiLogInterceptor({required this.persistenceHelper});

  final PersistenceHelper persistenceHelper;
  static const _logKey = 'api_log_key';

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final newLog = ApiLogData(
      method: options.method,
      url: options.uri.path,
      queryParameters: options.queryParameters,
      data: options.data,
      date: DateTime.now(),
    );
    if (await persistenceHelper.exists(_logKey)) {
      final result = await persistenceHelper.get(_logKey, ApiLogCall.fromJson);
      result.fold(
        (left) async {
          await persistenceHelper.set(_logKey, ApiLogCall(apiLogData: [newLog]));
        },
        (existingData) async {
          final apiLogCall = ApiLogCall(
            apiLogData: [newLog, ...existingData.apiLogData],
          );
          await persistenceHelper.set(_logKey, apiLogCall);
        },
      );
    } else {
      await persistenceHelper.set(_logKey, ApiLogCall(apiLogData: [newLog]));
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) async {
    final result = await persistenceHelper.get(_logKey, ApiLogCall.fromJson);
    result.fold(
      (left) => log('Error: $left'),
      (existingData) async {
        final noResponseItem = existingData.apiLogData.firstWhereOrNull(
          (element) => element.response == null && element.url == response.requestOptions.uri.path,
        );
        final apiLogData = existingData.apiLogData.map((e) {
          if (e == noResponseItem) return e.copyWith(response: response.data);
          return e;
        }).toList();
        await persistenceHelper.set(_logKey, ApiLogCall(apiLogData: apiLogData));
      },
    );
    super.onResponse(response, handler);
  }
}
