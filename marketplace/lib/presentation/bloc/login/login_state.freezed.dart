// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
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
    required TResult Function(LoginStateEmpty value) empty,
    required TResult Function(LoginStateSuccess value) success,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateNoNetwork value) noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateEmpty value)? empty,
    TResult? Function(LoginStateSuccess value)? success,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateNoNetwork value)? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateEmpty value)? empty,
    TResult Function(LoginStateSuccess value)? success,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginStateEmptyCopyWith<$Res> {
  factory _$$LoginStateEmptyCopyWith(
          _$LoginStateEmpty value, $Res Function(_$LoginStateEmpty) then) =
      __$$LoginStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginStateEmptyCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateEmpty>
    implements _$$LoginStateEmptyCopyWith<$Res> {
  __$$LoginStateEmptyCopyWithImpl(
      _$LoginStateEmpty _value, $Res Function(_$LoginStateEmpty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginStateEmpty implements LoginStateEmpty {
  const _$LoginStateEmpty();

  @override
  String toString() {
    return 'LoginState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginStateEmpty);
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
    required TResult Function(LoginStateEmpty value) empty,
    required TResult Function(LoginStateSuccess value) success,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateNoNetwork value) noNetwork,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateEmpty value)? empty,
    TResult? Function(LoginStateSuccess value)? success,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateNoNetwork value)? noNetwork,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateEmpty value)? empty,
    TResult Function(LoginStateSuccess value)? success,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class LoginStateEmpty implements LoginState {
  const factory LoginStateEmpty() = _$LoginStateEmpty;
}

/// @nodoc
abstract class _$$LoginStateSuccessCopyWith<$Res> {
  factory _$$LoginStateSuccessCopyWith(
          _$LoginStateSuccess value, $Res Function(_$LoginStateSuccess) then) =
      __$$LoginStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginStateSuccessCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateSuccess>
    implements _$$LoginStateSuccessCopyWith<$Res> {
  __$$LoginStateSuccessCopyWithImpl(
      _$LoginStateSuccess _value, $Res Function(_$LoginStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginStateSuccess implements LoginStateSuccess {
  const _$LoginStateSuccess();

  @override
  String toString() {
    return 'LoginState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginStateSuccess);
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
    required TResult Function(LoginStateEmpty value) empty,
    required TResult Function(LoginStateSuccess value) success,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateNoNetwork value) noNetwork,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateEmpty value)? empty,
    TResult? Function(LoginStateSuccess value)? success,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateNoNetwork value)? noNetwork,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateEmpty value)? empty,
    TResult Function(LoginStateSuccess value)? success,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoginStateSuccess implements LoginState {
  const factory LoginStateSuccess() = _$LoginStateSuccess;
}

/// @nodoc
abstract class _$$LoginStateErrorCopyWith<$Res> {
  factory _$$LoginStateErrorCopyWith(
          _$LoginStateError value, $Res Function(_$LoginStateError) then) =
      __$$LoginStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoginStateErrorCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateError>
    implements _$$LoginStateErrorCopyWith<$Res> {
  __$$LoginStateErrorCopyWithImpl(
      _$LoginStateError _value, $Res Function(_$LoginStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoginStateError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginStateError implements LoginStateError {
  const _$LoginStateError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'LoginState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateErrorCopyWith<_$LoginStateError> get copyWith =>
      __$$LoginStateErrorCopyWithImpl<_$LoginStateError>(this, _$identity);

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
    required TResult Function(LoginStateEmpty value) empty,
    required TResult Function(LoginStateSuccess value) success,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateNoNetwork value) noNetwork,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateEmpty value)? empty,
    TResult? Function(LoginStateSuccess value)? success,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateNoNetwork value)? noNetwork,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateEmpty value)? empty,
    TResult Function(LoginStateSuccess value)? success,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LoginStateError implements LoginState {
  const factory LoginStateError({required final String message}) =
      _$LoginStateError;

  String get message;
  @JsonKey(ignore: true)
  _$$LoginStateErrorCopyWith<_$LoginStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginStateNoNetworkCopyWith<$Res> {
  factory _$$LoginStateNoNetworkCopyWith(_$LoginStateNoNetwork value,
          $Res Function(_$LoginStateNoNetwork) then) =
      __$$LoginStateNoNetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginStateNoNetworkCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateNoNetwork>
    implements _$$LoginStateNoNetworkCopyWith<$Res> {
  __$$LoginStateNoNetworkCopyWithImpl(
      _$LoginStateNoNetwork _value, $Res Function(_$LoginStateNoNetwork) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginStateNoNetwork implements LoginStateNoNetwork {
  const _$LoginStateNoNetwork();

  @override
  String toString() {
    return 'LoginState.noNetwork()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginStateNoNetwork);
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
    required TResult Function(LoginStateEmpty value) empty,
    required TResult Function(LoginStateSuccess value) success,
    required TResult Function(LoginStateError value) error,
    required TResult Function(LoginStateNoNetwork value) noNetwork,
  }) {
    return noNetwork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginStateEmpty value)? empty,
    TResult? Function(LoginStateSuccess value)? success,
    TResult? Function(LoginStateError value)? error,
    TResult? Function(LoginStateNoNetwork value)? noNetwork,
  }) {
    return noNetwork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginStateEmpty value)? empty,
    TResult Function(LoginStateSuccess value)? success,
    TResult Function(LoginStateError value)? error,
    TResult Function(LoginStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (noNetwork != null) {
      return noNetwork(this);
    }
    return orElse();
  }
}

abstract class LoginStateNoNetwork implements LoginState {
  const factory LoginStateNoNetwork() = _$LoginStateNoNetwork;
}
