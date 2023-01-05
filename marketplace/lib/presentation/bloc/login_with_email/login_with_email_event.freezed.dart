// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_with_email_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginWithEmailEvent {
  Login get login => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Login login) onLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Login login)? onLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Login login)? onLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginWithEmailOnLogin value) onLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginWithEmailOnLogin value)? onLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginWithEmailOnLogin value)? onLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginWithEmailEventCopyWith<LoginWithEmailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginWithEmailEventCopyWith<$Res> {
  factory $LoginWithEmailEventCopyWith(
          LoginWithEmailEvent value, $Res Function(LoginWithEmailEvent) then) =
      _$LoginWithEmailEventCopyWithImpl<$Res, LoginWithEmailEvent>;
  @useResult
  $Res call({Login login});

  $LoginCopyWith<$Res> get login;
}

/// @nodoc
class _$LoginWithEmailEventCopyWithImpl<$Res, $Val extends LoginWithEmailEvent>
    implements $LoginWithEmailEventCopyWith<$Res> {
  _$LoginWithEmailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as Login,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginCopyWith<$Res> get login {
    return $LoginCopyWith<$Res>(_value.login, (value) {
      return _then(_value.copyWith(login: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginWithEmailOnLoginCopyWith<$Res>
    implements $LoginWithEmailEventCopyWith<$Res> {
  factory _$$LoginWithEmailOnLoginCopyWith(_$LoginWithEmailOnLogin value,
          $Res Function(_$LoginWithEmailOnLogin) then) =
      __$$LoginWithEmailOnLoginCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Login login});

  @override
  $LoginCopyWith<$Res> get login;
}

/// @nodoc
class __$$LoginWithEmailOnLoginCopyWithImpl<$Res>
    extends _$LoginWithEmailEventCopyWithImpl<$Res, _$LoginWithEmailOnLogin>
    implements _$$LoginWithEmailOnLoginCopyWith<$Res> {
  __$$LoginWithEmailOnLoginCopyWithImpl(_$LoginWithEmailOnLogin _value,
      $Res Function(_$LoginWithEmailOnLogin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
  }) {
    return _then(_$LoginWithEmailOnLogin(
      null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as Login,
    ));
  }
}

/// @nodoc

class _$LoginWithEmailOnLogin implements LoginWithEmailOnLogin {
  const _$LoginWithEmailOnLogin(this.login);

  @override
  final Login login;

  @override
  String toString() {
    return 'LoginWithEmailEvent.onLogin(login: $login)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithEmailOnLogin &&
            (identical(other.login, login) || other.login == login));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithEmailOnLoginCopyWith<_$LoginWithEmailOnLogin> get copyWith =>
      __$$LoginWithEmailOnLoginCopyWithImpl<_$LoginWithEmailOnLogin>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Login login) onLogin,
  }) {
    return onLogin(login);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Login login)? onLogin,
  }) {
    return onLogin?.call(login);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Login login)? onLogin,
    required TResult orElse(),
  }) {
    if (onLogin != null) {
      return onLogin(login);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginWithEmailOnLogin value) onLogin,
  }) {
    return onLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginWithEmailOnLogin value)? onLogin,
  }) {
    return onLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginWithEmailOnLogin value)? onLogin,
    required TResult orElse(),
  }) {
    if (onLogin != null) {
      return onLogin(this);
    }
    return orElse();
  }
}

abstract class LoginWithEmailOnLogin implements LoginWithEmailEvent {
  const factory LoginWithEmailOnLogin(final Login login) =
      _$LoginWithEmailOnLogin;

  @override
  Login get login;
  @override
  @JsonKey(ignore: true)
  _$$LoginWithEmailOnLoginCopyWith<_$LoginWithEmailOnLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
