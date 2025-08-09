// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persistence_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PersistenceFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() typeMismatch,
    required TResult Function(String error) other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? typeMismatch,
    TResult? Function(String error)? other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? typeMismatch,
    TResult Function(String error)? other,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFoundPersistenceFailure value) notFound,
    required TResult Function(TypeMismatchPersistenceFailure value)
        typeMismatch,
    required TResult Function(OtherPersistenceFailure value) other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFoundPersistenceFailure value)? notFound,
    TResult? Function(TypeMismatchPersistenceFailure value)? typeMismatch,
    TResult? Function(OtherPersistenceFailure value)? other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFoundPersistenceFailure value)? notFound,
    TResult Function(TypeMismatchPersistenceFailure value)? typeMismatch,
    TResult Function(OtherPersistenceFailure value)? other,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersistenceFailureCopyWith<$Res> {
  factory $PersistenceFailureCopyWith(
          PersistenceFailure value, $Res Function(PersistenceFailure) then) =
      _$PersistenceFailureCopyWithImpl<$Res, PersistenceFailure>;
}

/// @nodoc
class _$PersistenceFailureCopyWithImpl<$Res, $Val extends PersistenceFailure>
    implements $PersistenceFailureCopyWith<$Res> {
  _$PersistenceFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotFoundPersistenceFailureImplCopyWith<$Res> {
  factory _$$NotFoundPersistenceFailureImplCopyWith(
          _$NotFoundPersistenceFailureImpl value,
          $Res Function(_$NotFoundPersistenceFailureImpl) then) =
      __$$NotFoundPersistenceFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundPersistenceFailureImplCopyWithImpl<$Res>
    extends _$PersistenceFailureCopyWithImpl<$Res,
        _$NotFoundPersistenceFailureImpl>
    implements _$$NotFoundPersistenceFailureImplCopyWith<$Res> {
  __$$NotFoundPersistenceFailureImplCopyWithImpl(
      _$NotFoundPersistenceFailureImpl _value,
      $Res Function(_$NotFoundPersistenceFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotFoundPersistenceFailureImpl implements NotFoundPersistenceFailure {
  const _$NotFoundPersistenceFailureImpl();

  @override
  String toString() {
    return 'PersistenceFailure.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundPersistenceFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() typeMismatch,
    required TResult Function(String error) other,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? typeMismatch,
    TResult? Function(String error)? other,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? typeMismatch,
    TResult Function(String error)? other,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFoundPersistenceFailure value) notFound,
    required TResult Function(TypeMismatchPersistenceFailure value)
        typeMismatch,
    required TResult Function(OtherPersistenceFailure value) other,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFoundPersistenceFailure value)? notFound,
    TResult? Function(TypeMismatchPersistenceFailure value)? typeMismatch,
    TResult? Function(OtherPersistenceFailure value)? other,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFoundPersistenceFailure value)? notFound,
    TResult Function(TypeMismatchPersistenceFailure value)? typeMismatch,
    TResult Function(OtherPersistenceFailure value)? other,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundPersistenceFailure implements PersistenceFailure {
  const factory NotFoundPersistenceFailure() = _$NotFoundPersistenceFailureImpl;
}

/// @nodoc
abstract class _$$TypeMismatchPersistenceFailureImplCopyWith<$Res> {
  factory _$$TypeMismatchPersistenceFailureImplCopyWith(
          _$TypeMismatchPersistenceFailureImpl value,
          $Res Function(_$TypeMismatchPersistenceFailureImpl) then) =
      __$$TypeMismatchPersistenceFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TypeMismatchPersistenceFailureImplCopyWithImpl<$Res>
    extends _$PersistenceFailureCopyWithImpl<$Res,
        _$TypeMismatchPersistenceFailureImpl>
    implements _$$TypeMismatchPersistenceFailureImplCopyWith<$Res> {
  __$$TypeMismatchPersistenceFailureImplCopyWithImpl(
      _$TypeMismatchPersistenceFailureImpl _value,
      $Res Function(_$TypeMismatchPersistenceFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TypeMismatchPersistenceFailureImpl
    implements TypeMismatchPersistenceFailure {
  const _$TypeMismatchPersistenceFailureImpl();

  @override
  String toString() {
    return 'PersistenceFailure.typeMismatch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeMismatchPersistenceFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() typeMismatch,
    required TResult Function(String error) other,
  }) {
    return typeMismatch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? typeMismatch,
    TResult? Function(String error)? other,
  }) {
    return typeMismatch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? typeMismatch,
    TResult Function(String error)? other,
    required TResult orElse(),
  }) {
    if (typeMismatch != null) {
      return typeMismatch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFoundPersistenceFailure value) notFound,
    required TResult Function(TypeMismatchPersistenceFailure value)
        typeMismatch,
    required TResult Function(OtherPersistenceFailure value) other,
  }) {
    return typeMismatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFoundPersistenceFailure value)? notFound,
    TResult? Function(TypeMismatchPersistenceFailure value)? typeMismatch,
    TResult? Function(OtherPersistenceFailure value)? other,
  }) {
    return typeMismatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFoundPersistenceFailure value)? notFound,
    TResult Function(TypeMismatchPersistenceFailure value)? typeMismatch,
    TResult Function(OtherPersistenceFailure value)? other,
    required TResult orElse(),
  }) {
    if (typeMismatch != null) {
      return typeMismatch(this);
    }
    return orElse();
  }
}

abstract class TypeMismatchPersistenceFailure implements PersistenceFailure {
  const factory TypeMismatchPersistenceFailure() =
      _$TypeMismatchPersistenceFailureImpl;
}

/// @nodoc
abstract class _$$OtherPersistenceFailureImplCopyWith<$Res> {
  factory _$$OtherPersistenceFailureImplCopyWith(
          _$OtherPersistenceFailureImpl value,
          $Res Function(_$OtherPersistenceFailureImpl) then) =
      __$$OtherPersistenceFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$OtherPersistenceFailureImplCopyWithImpl<$Res>
    extends _$PersistenceFailureCopyWithImpl<$Res,
        _$OtherPersistenceFailureImpl>
    implements _$$OtherPersistenceFailureImplCopyWith<$Res> {
  __$$OtherPersistenceFailureImplCopyWithImpl(
      _$OtherPersistenceFailureImpl _value,
      $Res Function(_$OtherPersistenceFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$OtherPersistenceFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtherPersistenceFailureImpl implements OtherPersistenceFailure {
  const _$OtherPersistenceFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PersistenceFailure.other(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherPersistenceFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherPersistenceFailureImplCopyWith<_$OtherPersistenceFailureImpl>
      get copyWith => __$$OtherPersistenceFailureImplCopyWithImpl<
          _$OtherPersistenceFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() typeMismatch,
    required TResult Function(String error) other,
  }) {
    return other(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? typeMismatch,
    TResult? Function(String error)? other,
  }) {
    return other?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? typeMismatch,
    TResult Function(String error)? other,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFoundPersistenceFailure value) notFound,
    required TResult Function(TypeMismatchPersistenceFailure value)
        typeMismatch,
    required TResult Function(OtherPersistenceFailure value) other,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFoundPersistenceFailure value)? notFound,
    TResult? Function(TypeMismatchPersistenceFailure value)? typeMismatch,
    TResult? Function(OtherPersistenceFailure value)? other,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFoundPersistenceFailure value)? notFound,
    TResult Function(TypeMismatchPersistenceFailure value)? typeMismatch,
    TResult Function(OtherPersistenceFailure value)? other,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(this);
    }
    return orElse();
  }
}

abstract class OtherPersistenceFailure implements PersistenceFailure {
  const factory OtherPersistenceFailure(final String error) =
      _$OtherPersistenceFailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$OtherPersistenceFailureImplCopyWith<_$OtherPersistenceFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
