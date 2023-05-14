// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGoogleLogin,
    required TResult Function() onGitHubLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGoogleLogin,
    TResult? Function()? onGitHubLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGoogleLogin,
    TResult Function()? onGitHubLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginOnGoogleLogin value) onGoogleLogin,
    required TResult Function(LoginOnGitHubLogin value) onGitHubLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginOnGoogleLogin value)? onGoogleLogin,
    TResult? Function(LoginOnGitHubLogin value)? onGitHubLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginOnGoogleLogin value)? onGoogleLogin,
    TResult Function(LoginOnGitHubLogin value)? onGitHubLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginOnGoogleLoginCopyWith<$Res> {
  factory _$$LoginOnGoogleLoginCopyWith(_$LoginOnGoogleLogin value,
          $Res Function(_$LoginOnGoogleLogin) then) =
      __$$LoginOnGoogleLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginOnGoogleLoginCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginOnGoogleLogin>
    implements _$$LoginOnGoogleLoginCopyWith<$Res> {
  __$$LoginOnGoogleLoginCopyWithImpl(
      _$LoginOnGoogleLogin _value, $Res Function(_$LoginOnGoogleLogin) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginOnGoogleLogin implements LoginOnGoogleLogin {
  const _$LoginOnGoogleLogin();

  @override
  String toString() {
    return 'LoginEvent.onGoogleLogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginOnGoogleLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGoogleLogin,
    required TResult Function() onGitHubLogin,
  }) {
    return onGoogleLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGoogleLogin,
    TResult? Function()? onGitHubLogin,
  }) {
    return onGoogleLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGoogleLogin,
    TResult Function()? onGitHubLogin,
    required TResult orElse(),
  }) {
    if (onGoogleLogin != null) {
      return onGoogleLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginOnGoogleLogin value) onGoogleLogin,
    required TResult Function(LoginOnGitHubLogin value) onGitHubLogin,
  }) {
    return onGoogleLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginOnGoogleLogin value)? onGoogleLogin,
    TResult? Function(LoginOnGitHubLogin value)? onGitHubLogin,
  }) {
    return onGoogleLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginOnGoogleLogin value)? onGoogleLogin,
    TResult Function(LoginOnGitHubLogin value)? onGitHubLogin,
    required TResult orElse(),
  }) {
    if (onGoogleLogin != null) {
      return onGoogleLogin(this);
    }
    return orElse();
  }
}

abstract class LoginOnGoogleLogin implements LoginEvent {
  const factory LoginOnGoogleLogin() = _$LoginOnGoogleLogin;
}

/// @nodoc
abstract class _$$LoginOnGitHubLoginCopyWith<$Res> {
  factory _$$LoginOnGitHubLoginCopyWith(_$LoginOnGitHubLogin value,
          $Res Function(_$LoginOnGitHubLogin) then) =
      __$$LoginOnGitHubLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginOnGitHubLoginCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginOnGitHubLogin>
    implements _$$LoginOnGitHubLoginCopyWith<$Res> {
  __$$LoginOnGitHubLoginCopyWithImpl(
      _$LoginOnGitHubLogin _value, $Res Function(_$LoginOnGitHubLogin) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginOnGitHubLogin implements LoginOnGitHubLogin {
  const _$LoginOnGitHubLogin();

  @override
  String toString() {
    return 'LoginEvent.onGitHubLogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginOnGitHubLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGoogleLogin,
    required TResult Function() onGitHubLogin,
  }) {
    return onGitHubLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGoogleLogin,
    TResult? Function()? onGitHubLogin,
  }) {
    return onGitHubLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGoogleLogin,
    TResult Function()? onGitHubLogin,
    required TResult orElse(),
  }) {
    if (onGitHubLogin != null) {
      return onGitHubLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginOnGoogleLogin value) onGoogleLogin,
    required TResult Function(LoginOnGitHubLogin value) onGitHubLogin,
  }) {
    return onGitHubLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginOnGoogleLogin value)? onGoogleLogin,
    TResult? Function(LoginOnGitHubLogin value)? onGitHubLogin,
  }) {
    return onGitHubLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginOnGoogleLogin value)? onGoogleLogin,
    TResult Function(LoginOnGitHubLogin value)? onGitHubLogin,
    required TResult orElse(),
  }) {
    if (onGitHubLogin != null) {
      return onGitHubLogin(this);
    }
    return orElse();
  }
}

abstract class LoginOnGitHubLogin implements LoginEvent {
  const factory LoginOnGitHubLogin() = _$LoginOnGitHubLogin;
}
