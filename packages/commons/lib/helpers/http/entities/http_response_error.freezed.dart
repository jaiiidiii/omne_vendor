// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_response_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ErrorType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherErrorType value) error,
    required TResult Function(ConnectionErrorType value) noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherErrorType value)? error,
    TResult? Function(ConnectionErrorType value)? noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherErrorType value)? error,
    TResult Function(ConnectionErrorType value)? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorTypeCopyWith<$Res> {
  factory $ErrorTypeCopyWith(ErrorType value, $Res Function(ErrorType) then) =
      _$ErrorTypeCopyWithImpl<$Res, ErrorType>;
}

/// @nodoc
class _$ErrorTypeCopyWithImpl<$Res, $Val extends ErrorType>
    implements $ErrorTypeCopyWith<$Res> {
  _$ErrorTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OtherErrorTypeImplCopyWith<$Res> {
  factory _$$OtherErrorTypeImplCopyWith(_$OtherErrorTypeImpl value,
          $Res Function(_$OtherErrorTypeImpl) then) =
      __$$OtherErrorTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtherErrorTypeImplCopyWithImpl<$Res>
    extends _$ErrorTypeCopyWithImpl<$Res, _$OtherErrorTypeImpl>
    implements _$$OtherErrorTypeImplCopyWith<$Res> {
  __$$OtherErrorTypeImplCopyWithImpl(
      _$OtherErrorTypeImpl _value, $Res Function(_$OtherErrorTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OtherErrorTypeImpl implements OtherErrorType {
  const _$OtherErrorTypeImpl();

  @override
  String toString() {
    return 'ErrorType.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtherErrorTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() noConnection,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? noConnection,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherErrorType value) error,
    required TResult Function(ConnectionErrorType value) noConnection,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherErrorType value)? error,
    TResult? Function(ConnectionErrorType value)? noConnection,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherErrorType value)? error,
    TResult Function(ConnectionErrorType value)? noConnection,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OtherErrorType implements ErrorType {
  const factory OtherErrorType() = _$OtherErrorTypeImpl;
}

/// @nodoc
abstract class _$$ConnectionErrorTypeImplCopyWith<$Res> {
  factory _$$ConnectionErrorTypeImplCopyWith(_$ConnectionErrorTypeImpl value,
          $Res Function(_$ConnectionErrorTypeImpl) then) =
      __$$ConnectionErrorTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionErrorTypeImplCopyWithImpl<$Res>
    extends _$ErrorTypeCopyWithImpl<$Res, _$ConnectionErrorTypeImpl>
    implements _$$ConnectionErrorTypeImplCopyWith<$Res> {
  __$$ConnectionErrorTypeImplCopyWithImpl(_$ConnectionErrorTypeImpl _value,
      $Res Function(_$ConnectionErrorTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectionErrorTypeImpl implements ConnectionErrorType {
  const _$ConnectionErrorTypeImpl();

  @override
  String toString() {
    return 'ErrorType.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionErrorTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() noConnection,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? noConnection,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OtherErrorType value) error,
    required TResult Function(ConnectionErrorType value) noConnection,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OtherErrorType value)? error,
    TResult? Function(ConnectionErrorType value)? noConnection,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OtherErrorType value)? error,
    TResult Function(ConnectionErrorType value)? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class ConnectionErrorType implements ErrorType {
  const factory ConnectionErrorType() = _$ConnectionErrorTypeImpl;
}
