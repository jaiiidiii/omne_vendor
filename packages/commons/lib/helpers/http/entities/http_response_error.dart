import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_response_error.freezed.dart';

class HttpResponseError {
  HttpResponseError({
    required this.errorType,
    required this.message,
    this.stackTrace,
    int? statusCode,
  }) : statusCode = statusCode ?? 999;

  final int statusCode;
  final String? message;
  final ErrorType errorType;
  final StackTrace? stackTrace;
}

@freezed
class ErrorType with _$ErrorType {
  const factory ErrorType.error() = OtherErrorType;

  const factory ErrorType.noConnection() = ConnectionErrorType;
}
