// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_password_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordEvent {
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) onResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? onResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? onResetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPasswordOnResetPassword value)
        onResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPasswordOnResetPassword value)? onResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPasswordOnResetPassword value)? onResetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordEventCopyWith<ResetPasswordEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordEventCopyWith<$Res> {
  factory $ResetPasswordEventCopyWith(
          ResetPasswordEvent value, $Res Function(ResetPasswordEvent) then) =
      _$ResetPasswordEventCopyWithImpl<$Res, ResetPasswordEvent>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ResetPasswordEventCopyWithImpl<$Res, $Val extends ResetPasswordEvent>
    implements $ResetPasswordEventCopyWith<$Res> {
  _$ResetPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordOnResetPasswordCopyWith<$Res>
    implements $ResetPasswordEventCopyWith<$Res> {
  factory _$$ResetPasswordOnResetPasswordCopyWith(
          _$ResetPasswordOnResetPassword value,
          $Res Function(_$ResetPasswordOnResetPassword) then) =
      __$$ResetPasswordOnResetPasswordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ResetPasswordOnResetPasswordCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res,
        _$ResetPasswordOnResetPassword>
    implements _$$ResetPasswordOnResetPasswordCopyWith<$Res> {
  __$$ResetPasswordOnResetPasswordCopyWithImpl(
      _$ResetPasswordOnResetPassword _value,
      $Res Function(_$ResetPasswordOnResetPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ResetPasswordOnResetPassword(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResetPasswordOnResetPassword implements ResetPasswordOnResetPassword {
  const _$ResetPasswordOnResetPassword({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'ResetPasswordEvent.onResetPassword(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordOnResetPassword &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordOnResetPasswordCopyWith<_$ResetPasswordOnResetPassword>
      get copyWith => __$$ResetPasswordOnResetPasswordCopyWithImpl<
          _$ResetPasswordOnResetPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) onResetPassword,
  }) {
    return onResetPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? onResetPassword,
  }) {
    return onResetPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? onResetPassword,
    required TResult orElse(),
  }) {
    if (onResetPassword != null) {
      return onResetPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPasswordOnResetPassword value)
        onResetPassword,
  }) {
    return onResetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPasswordOnResetPassword value)? onResetPassword,
  }) {
    return onResetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPasswordOnResetPassword value)? onResetPassword,
    required TResult orElse(),
  }) {
    if (onResetPassword != null) {
      return onResetPassword(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordOnResetPassword implements ResetPasswordEvent {
  const factory ResetPasswordOnResetPassword({required final String email}) =
      _$ResetPasswordOnResetPassword;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordOnResetPasswordCopyWith<_$ResetPasswordOnResetPassword>
      get copyWith => throw _privateConstructorUsedError;
}
