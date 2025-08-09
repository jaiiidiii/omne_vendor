import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_type.freezed.dart';

@freezed
class PermissionType with _$PermissionType {
  const factory PermissionType.camera() = CameraPermissionType;

  const factory PermissionType.location() = LocationPermissionType;
}
