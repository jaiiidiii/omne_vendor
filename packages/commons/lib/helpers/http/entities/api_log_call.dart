import 'package:commons/helpers/http/entities/api_log_data.dart';
import 'package:commons/helpers/persistence_helper/persistable_object.dart';

class ApiLogCall implements PersistableObject {
  ApiLogCall({required this.apiLogData});

  factory ApiLogCall.fromJson(Map<String, dynamic> json) {
    return ApiLogCall(
      apiLogData: (json['apiLogData'] as List).map((e) => ApiLogData.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  final List<ApiLogData> apiLogData;

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiLogData': apiLogData.map((e) => e.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiLogCall && runtimeType == other.runtimeType && apiLogData == other.apiLogData;

  @override
  int get hashCode => apiLogData.hashCode;
}
