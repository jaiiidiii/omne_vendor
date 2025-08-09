// ignore_for_file: type_annotate_public_apis

class ApiLogData {
  ApiLogData({
    required this.method,
    required this.url,
    required this.queryParameters,
    required this.data,
    required this.date,
    this.response,
  });

  factory ApiLogData.fromJson(Map<String, dynamic> json) {
    return ApiLogData(
      date: DateTime.parse(json['date'] as String),
      method: json['method'] as String,
      url: json['url'] as String,
      queryParameters: Map<String, dynamic>.from(json['headers'] as Map),
      data: json['data'],
      response: json['response'],
    );
  }

  final DateTime date;
  final String method, url;
  final Map<String, dynamic> queryParameters;
  final dynamic response;
  final dynamic data;

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'method': method,
      'url': url,
      'headers': queryParameters,
      'data': data,
      'response': response,
    };
  }

  ApiLogData copyWith({response}) {
    return ApiLogData(
      date: date,
      method: method,
      url: url,
      queryParameters: queryParameters,
      data: data,
      response: response ?? this.response,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiLogData &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          method == other.method &&
          url == other.url &&
          queryParameters == other.queryParameters &&
          response == other.response &&
          data == other.data;

  @override
  int get hashCode =>
      date.hashCode ^ method.hashCode ^ url.hashCode ^ queryParameters.hashCode ^ response.hashCode ^ data.hashCode;
}
