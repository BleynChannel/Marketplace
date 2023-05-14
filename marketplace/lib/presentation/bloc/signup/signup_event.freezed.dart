// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpEvent {
  SignUp get signUp => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SignUp signUp) onSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SignUp signUp)? onSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SignUp signUp)? onSignUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpOnSignUp value) onSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpOnSignUp value)? onSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpOnSignUp value)? onSignUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpEventCopyWith<SignUpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
  @useResult
  $Res call({SignUp signUp});

  $SignUpCopyWith<$Res> get signUp;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signUp = null,
  }) {
    return _then(_value.copyWith(
      signUp: null == signUp
          ? _value.signUp
          : signUp // ignore: cast_nullable_to_non_nullable
              as SignUp,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignUpCopyWith<$Res> get signUp {
    return $SignUpCopyWith<$Res>(_value.signUp, (value) {
      return _then(_value.copyWith(signUp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignUpOnSignUpCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory _$$SignUpOnSignUpCopyWith(
          _$SignUpOnSignUp value, $Res Function(_$SignUpOnSignUp) then) =
      __$$SignUpOnSignUpCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SignUp signUp});

  @override
  $SignUpCopyWith<$Res> get signUp;
}

/// @nodoc
class __$$SignUpOnSignUpCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignUpOnSignUp>
    implements _$$SignUpOnSignUpCopyWith<$Res> {
  __$$SignUpOnSignUpCopyWithImpl(
      _$SignUpOnSignUp _value, $Res Function(_$SignUpOnSignUp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signUp = null,
  }) {
    return _then(_$SignUpOnSignUp(
      null == signUp
          ? _value.signUp
          : signUp // ignore: cast_nullable_to_non_nullable
              as SignUp,
    ));
  }
}

/// @nodoc

class _$SignUpOnSignUp implements SignUpOnSignUp {
  const _$SignUpOnSignUp(this.signUp);

  @override
  final SignUp signUp;

  @override
  String toString() {
    return 'SignUpEvent.onSignUp(signUp: $signUp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpOnSignUp &&
            (identical(other.signUp, signUp) || other.signUp == signUp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpOnSignUpCopyWith<_$SignUpOnSignUp> get copyWith =>
      __$$SignUpOnSignUpCopyWithImpl<_$SignUpOnSignUp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SignUp signUp) onSignUp,
  }) {
    return onSignUp(signUp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SignUp signUp)? onSignUp,
  }) {
    return onSignUp?.call(signUp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SignUp signUp)? onSignUp,
    required TResult orElse(),
  }) {
    if (onSignUp != null) {
      return onSignUp(signUp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpOnSignUp value) onSignUp,
  }) {
    return onSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpOnSignUp value)? onSignUp,
  }) {
    return onSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpOnSignUp value)? onSignUp,
    required TResult orElse(),
  }) {
    if (onSignUp != null) {
      return onSignUp(this);
    }
    return orElse();
  }
}

abstract class SignUpOnSignUp implements SignUpEvent {
  const factory SignUpOnSignUp(final SignUp signUp) = _$SignUpOnSignUp;

  @override
  SignUp get signUp;
  @override
  @JsonKey(ignore: true)
  _$$SignUpOnSignUpCopyWith<_$SignUpOnSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}
