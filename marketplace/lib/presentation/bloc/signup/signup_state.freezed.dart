// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpStateEmpty value) empty,
    required TResult Function(SignUpStateSuccess value) success,
    required TResult Function(SignUpStateError value) error,
    required TResult Function(SignUpStateNoNetwork value) noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpStateEmpty value)? empty,
    TResult? Function(SignUpStateSuccess value)? success,
    TResult? Function(SignUpStateError value)? error,
    TResult? Function(SignUpStateNoNetwork value)? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpStateEmpty value)? empty,
    TResult Function(SignUpStateSuccess value)? success,
    TResult Function(SignUpStateError value)? error,
    TResult Function(SignUpStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignUpStateEmptyCopyWith<$Res> {
  factory _$$SignUpStateEmptyCopyWith(
          _$SignUpStateEmpty value, $Res Function(_$SignUpStateEmpty) then) =
      __$$SignUpStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpStateEmptyCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateEmpty>
    implements _$$SignUpStateEmptyCopyWith<$Res> {
  __$$SignUpStateEmptyCopyWithImpl(
      _$SignUpStateEmpty _value, $Res Function(_$SignUpStateEmpty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpStateEmpty implements SignUpStateEmpty {
  const _$SignUpStateEmpty();

  @override
  String toString() {
    return 'SignUpState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpStateEmpty value) empty,
    required TResult Function(SignUpStateSuccess value) success,
    required TResult Function(SignUpStateError value) error,
    required TResult Function(SignUpStateNoNetwork value) noNetwork,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpStateEmpty value)? empty,
    TResult? Function(SignUpStateSuccess value)? success,
    TResult? Function(SignUpStateError value)? error,
    TResult? Function(SignUpStateNoNetwork value)? noNetwork,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpStateEmpty value)? empty,
    TResult Function(SignUpStateSuccess value)? success,
    TResult Function(SignUpStateError value)? error,
    TResult Function(SignUpStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class SignUpStateEmpty implements SignUpState {
  const factory SignUpStateEmpty() = _$SignUpStateEmpty;
}

/// @nodoc
abstract class _$$SignUpStateSuccessCopyWith<$Res> {
  factory _$$SignUpStateSuccessCopyWith(_$SignUpStateSuccess value,
          $Res Function(_$SignUpStateSuccess) then) =
      __$$SignUpStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpStateSuccessCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateSuccess>
    implements _$$SignUpStateSuccessCopyWith<$Res> {
  __$$SignUpStateSuccessCopyWithImpl(
      _$SignUpStateSuccess _value, $Res Function(_$SignUpStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpStateSuccess implements SignUpStateSuccess {
  const _$SignUpStateSuccess();

  @override
  String toString() {
    return 'SignUpState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpStateEmpty value) empty,
    required TResult Function(SignUpStateSuccess value) success,
    required TResult Function(SignUpStateError value) error,
    required TResult Function(SignUpStateNoNetwork value) noNetwork,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpStateEmpty value)? empty,
    TResult? Function(SignUpStateSuccess value)? success,
    TResult? Function(SignUpStateError value)? error,
    TResult? Function(SignUpStateNoNetwork value)? noNetwork,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpStateEmpty value)? empty,
    TResult Function(SignUpStateSuccess value)? success,
    TResult Function(SignUpStateError value)? error,
    TResult Function(SignUpStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SignUpStateSuccess implements SignUpState {
  const factory SignUpStateSuccess() = _$SignUpStateSuccess;
}

/// @nodoc
abstract class _$$SignUpStateErrorCopyWith<$Res> {
  factory _$$SignUpStateErrorCopyWith(
          _$SignUpStateError value, $Res Function(_$SignUpStateError) then) =
      __$$SignUpStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SignUpStateErrorCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateError>
    implements _$$SignUpStateErrorCopyWith<$Res> {
  __$$SignUpStateErrorCopyWithImpl(
      _$SignUpStateError _value, $Res Function(_$SignUpStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SignUpStateError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpStateError implements SignUpStateError {
  const _$SignUpStateError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SignUpState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateErrorCopyWith<_$SignUpStateError> get copyWith =>
      __$$SignUpStateErrorCopyWithImpl<_$SignUpStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpStateEmpty value) empty,
    required TResult Function(SignUpStateSuccess value) success,
    required TResult Function(SignUpStateError value) error,
    required TResult Function(SignUpStateNoNetwork value) noNetwork,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpStateEmpty value)? empty,
    TResult? Function(SignUpStateSuccess value)? success,
    TResult? Function(SignUpStateError value)? error,
    TResult? Function(SignUpStateNoNetwork value)? noNetwork,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpStateEmpty value)? empty,
    TResult Function(SignUpStateSuccess value)? success,
    TResult Function(SignUpStateError value)? error,
    TResult Function(SignUpStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SignUpStateError implements SignUpState {
  const factory SignUpStateError({required final String message}) =
      _$SignUpStateError;

  String get message;
  @JsonKey(ignore: true)
  _$$SignUpStateErrorCopyWith<_$SignUpStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpStateNoNetworkCopyWith<$Res> {
  factory _$$SignUpStateNoNetworkCopyWith(_$SignUpStateNoNetwork value,
          $Res Function(_$SignUpStateNoNetwork) then) =
      __$$SignUpStateNoNetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpStateNoNetworkCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateNoNetwork>
    implements _$$SignUpStateNoNetworkCopyWith<$Res> {
  __$$SignUpStateNoNetworkCopyWithImpl(_$SignUpStateNoNetwork _value,
      $Res Function(_$SignUpStateNoNetwork) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpStateNoNetwork implements SignUpStateNoNetwork {
  const _$SignUpStateNoNetwork();

  @override
  String toString() {
    return 'SignUpState.noNetwork()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpStateNoNetwork);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return noNetwork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return noNetwork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) {
    if (noNetwork != null) {
      return noNetwork();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpStateEmpty value) empty,
    required TResult Function(SignUpStateSuccess value) success,
    required TResult Function(SignUpStateError value) error,
    required TResult Function(SignUpStateNoNetwork value) noNetwork,
  }) {
    return noNetwork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpStateEmpty value)? empty,
    TResult? Function(SignUpStateSuccess value)? success,
    TResult? Function(SignUpStateError value)? error,
    TResult? Function(SignUpStateNoNetwork value)? noNetwork,
  }) {
    return noNetwork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpStateEmpty value)? empty,
    TResult Function(SignUpStateSuccess value)? success,
    TResult Function(SignUpStateError value)? error,
    TResult Function(SignUpStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (noNetwork != null) {
      return noNetwork(this);
    }
    return orElse();
  }
}

abstract class SignUpStateNoNetwork implements SignUpState {
  const factory SignUpStateNoNetwork() = _$SignUpStateNoNetwork;
}
