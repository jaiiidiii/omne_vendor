// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PermissionType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() camera,
    required TResult Function() location,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? camera,
    TResult? Function()? location,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? camera,
    TResult Function()? location,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraPermissionType value) camera,
    required TResult Function(LocationPermissionType value) location,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraPermissionType value)? camera,
    TResult? Function(LocationPermissionType value)? location,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraPermissionType value)? camera,
    TResult Function(LocationPermissionType value)? location,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionTypeCopyWith<$Res> {
  factory $PermissionTypeCopyWith(
          PermissionType value, $Res Function(PermissionType) then) =
      _$PermissionTypeCopyWithImpl<$Res, PermissionType>;
}

/// @nodoc
class _$PermissionTypeCopyWithImpl<$Res, $Val extends PermissionType>
    implements $PermissionTypeCopyWith<$Res> {
  _$PermissionTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CameraPermissionTypeImplCopyWith<$Res> {
  factory _$$CameraPermissionTypeImplCopyWith(_$CameraPermissionTypeImpl value,
          $Res Function(_$CameraPermissionTypeImpl) then) =
      __$$CameraPermissionTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraPermissionTypeImplCopyWithImpl<$Res>
    extends _$PermissionTypeCopyWithImpl<$Res, _$CameraPermissionTypeImpl>
    implements _$$CameraPermissionTypeImplCopyWith<$Res> {
  __$$CameraPermissionTypeImplCopyWithImpl(_$CameraPermissionTypeImpl _value,
      $Res Function(_$CameraPermissionTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CameraPermissionTypeImpl
    with DiagnosticableTreeMixin
    implements CameraPermissionType {
  const _$CameraPermissionTypeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PermissionType.camera()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PermissionType.camera'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraPermissionTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() camera,
    required TResult Function() location,
  }) {
    return camera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? camera,
    TResult? Function()? location,
  }) {
    return camera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? camera,
    TResult Function()? location,
    required TResult orElse(),
  }) {
    if (camera != null) {
      return camera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraPermissionType value) camera,
    required TResult Function(LocationPermissionType value) location,
  }) {
    return camera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraPermissionType value)? camera,
    TResult? Function(LocationPermissionType value)? location,
  }) {
    return camera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraPermissionType value)? camera,
    TResult Function(LocationPermissionType value)? location,
    required TResult orElse(),
  }) {
    if (camera != null) {
      return camera(this);
    }
    return orElse();
  }
}

abstract class CameraPermissionType implements PermissionType {
  const factory CameraPermissionType() = _$CameraPermissionTypeImpl;
}

/// @nodoc
abstract class _$$LocationPermissionTypeImplCopyWith<$Res> {
  factory _$$LocationPermissionTypeImplCopyWith(
          _$LocationPermissionTypeImpl value,
          $Res Function(_$LocationPermissionTypeImpl) then) =
      __$$LocationPermissionTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocationPermissionTypeImplCopyWithImpl<$Res>
    extends _$PermissionTypeCopyWithImpl<$Res, _$LocationPermissionTypeImpl>
    implements _$$LocationPermissionTypeImplCopyWith<$Res> {
  __$$LocationPermissionTypeImplCopyWithImpl(
      _$LocationPermissionTypeImpl _value,
      $Res Function(_$LocationPermissionTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LocationPermissionTypeImpl
    with DiagnosticableTreeMixin
    implements LocationPermissionType {
  const _$LocationPermissionTypeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PermissionType.location()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PermissionType.location'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermissionTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() camera,
    required TResult Function() location,
  }) {
    return location();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? camera,
    TResult? Function()? location,
  }) {
    return location?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? camera,
    TResult Function()? location,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraPermissionType value) camera,
    required TResult Function(LocationPermissionType value) location,
  }) {
    return location(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraPermissionType value)? camera,
    TResult? Function(LocationPermissionType value)? location,
  }) {
    return location?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraPermissionType value)? camera,
    TResult Function(LocationPermissionType value)? location,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location(this);
    }
    return orElse();
  }
}

abstract class LocationPermissionType implements PermissionType {
  const factory LocationPermissionType() = _$LocationPermissionTypeImpl;
}
