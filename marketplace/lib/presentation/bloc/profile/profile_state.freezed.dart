// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Profile profile) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Profile profile)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Profile profile)? loading,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStateLoad value) load,
    required TResult Function(ProfileStateLoading value) loading,
    required TResult Function(ProfileStateError value) error,
    required TResult Function(ProfileStateNoNetwork value) noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateLoad value)? load,
    TResult? Function(ProfileStateLoading value)? loading,
    TResult? Function(ProfileStateError value)? error,
    TResult? Function(ProfileStateNoNetwork value)? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStateLoad value)? load,
    TResult Function(ProfileStateLoading value)? loading,
    TResult Function(ProfileStateError value)? error,
    TResult Function(ProfileStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProfileStateLoadCopyWith<$Res> {
  factory _$$ProfileStateLoadCopyWith(
          _$ProfileStateLoad value, $Res Function(_$ProfileStateLoad) then) =
      __$$ProfileStateLoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileStateLoadCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateLoad>
    implements _$$ProfileStateLoadCopyWith<$Res> {
  __$$ProfileStateLoadCopyWithImpl(
      _$ProfileStateLoad _value, $Res Function(_$ProfileStateLoad) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileStateLoad implements ProfileStateLoad {
  const _$ProfileStateLoad();

  @override
  String toString() {
    return 'ProfileState.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileStateLoad);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Profile profile) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Profile profile)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Profile profile)? loading,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStateLoad value) load,
    required TResult Function(ProfileStateLoading value) loading,
    required TResult Function(ProfileStateError value) error,
    required TResult Function(ProfileStateNoNetwork value) noNetwork,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateLoad value)? load,
    TResult? Function(ProfileStateLoading value)? loading,
    TResult? Function(ProfileStateError value)? error,
    TResult? Function(ProfileStateNoNetwork value)? noNetwork,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStateLoad value)? load,
    TResult Function(ProfileStateLoading value)? loading,
    TResult Function(ProfileStateError value)? error,
    TResult Function(ProfileStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class ProfileStateLoad implements ProfileState {
  const factory ProfileStateLoad() = _$ProfileStateLoad;
}

/// @nodoc
abstract class _$$ProfileStateLoadingCopyWith<$Res> {
  factory _$$ProfileStateLoadingCopyWith(_$ProfileStateLoading value,
          $Res Function(_$ProfileStateLoading) then) =
      __$$ProfileStateLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ProfileStateLoadingCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateLoading>
    implements _$$ProfileStateLoadingCopyWith<$Res> {
  __$$ProfileStateLoadingCopyWithImpl(
      _$ProfileStateLoading _value, $Res Function(_$ProfileStateLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$ProfileStateLoading(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$ProfileStateLoading implements ProfileStateLoading {
  const _$ProfileStateLoading({required this.profile});

  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileState.loading(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateLoading &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateLoadingCopyWith<_$ProfileStateLoading> get copyWith =>
      __$$ProfileStateLoadingCopyWithImpl<_$ProfileStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Profile profile) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return loading(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Profile profile)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return loading?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Profile profile)? loading,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStateLoad value) load,
    required TResult Function(ProfileStateLoading value) loading,
    required TResult Function(ProfileStateError value) error,
    required TResult Function(ProfileStateNoNetwork value) noNetwork,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateLoad value)? load,
    TResult? Function(ProfileStateLoading value)? loading,
    TResult? Function(ProfileStateError value)? error,
    TResult? Function(ProfileStateNoNetwork value)? noNetwork,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStateLoad value)? load,
    TResult Function(ProfileStateLoading value)? loading,
    TResult Function(ProfileStateError value)? error,
    TResult Function(ProfileStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProfileStateLoading implements ProfileState {
  const factory ProfileStateLoading({required final Profile profile}) =
      _$ProfileStateLoading;

  Profile get profile;
  @JsonKey(ignore: true)
  _$$ProfileStateLoadingCopyWith<_$ProfileStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileStateErrorCopyWith<$Res> {
  factory _$$ProfileStateErrorCopyWith(
          _$ProfileStateError value, $Res Function(_$ProfileStateError) then) =
      __$$ProfileStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ProfileStateErrorCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateError>
    implements _$$ProfileStateErrorCopyWith<$Res> {
  __$$ProfileStateErrorCopyWithImpl(
      _$ProfileStateError _value, $Res Function(_$ProfileStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ProfileStateError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileStateError implements ProfileStateError {
  const _$ProfileStateError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateErrorCopyWith<_$ProfileStateError> get copyWith =>
      __$$ProfileStateErrorCopyWithImpl<_$ProfileStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Profile profile) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Profile profile)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Profile profile)? loading,
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
    required TResult Function(ProfileStateLoad value) load,
    required TResult Function(ProfileStateLoading value) loading,
    required TResult Function(ProfileStateError value) error,
    required TResult Function(ProfileStateNoNetwork value) noNetwork,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateLoad value)? load,
    TResult? Function(ProfileStateLoading value)? loading,
    TResult? Function(ProfileStateError value)? error,
    TResult? Function(ProfileStateNoNetwork value)? noNetwork,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStateLoad value)? load,
    TResult Function(ProfileStateLoading value)? loading,
    TResult Function(ProfileStateError value)? error,
    TResult Function(ProfileStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProfileStateError implements ProfileState {
  const factory ProfileStateError({required final String message}) =
      _$ProfileStateError;

  String get message;
  @JsonKey(ignore: true)
  _$$ProfileStateErrorCopyWith<_$ProfileStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileStateNoNetworkCopyWith<$Res> {
  factory _$$ProfileStateNoNetworkCopyWith(_$ProfileStateNoNetwork value,
          $Res Function(_$ProfileStateNoNetwork) then) =
      __$$ProfileStateNoNetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileStateNoNetworkCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateNoNetwork>
    implements _$$ProfileStateNoNetworkCopyWith<$Res> {
  __$$ProfileStateNoNetworkCopyWithImpl(_$ProfileStateNoNetwork _value,
      $Res Function(_$ProfileStateNoNetwork) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileStateNoNetwork implements ProfileStateNoNetwork {
  const _$ProfileStateNoNetwork();

  @override
  String toString() {
    return 'ProfileState.noNetwork()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileStateNoNetwork);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Profile profile) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return noNetwork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Profile profile)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return noNetwork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Profile profile)? loading,
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
    required TResult Function(ProfileStateLoad value) load,
    required TResult Function(ProfileStateLoading value) loading,
    required TResult Function(ProfileStateError value) error,
    required TResult Function(ProfileStateNoNetwork value) noNetwork,
  }) {
    return noNetwork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateLoad value)? load,
    TResult? Function(ProfileStateLoading value)? loading,
    TResult? Function(ProfileStateError value)? error,
    TResult? Function(ProfileStateNoNetwork value)? noNetwork,
  }) {
    return noNetwork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStateLoad value)? load,
    TResult Function(ProfileStateLoading value)? loading,
    TResult Function(ProfileStateError value)? error,
    TResult Function(ProfileStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (noNetwork != null) {
      return noNetwork(this);
    }
    return orElse();
  }
}

abstract class ProfileStateNoNetwork implements ProfileState {
  const factory ProfileStateNoNetwork() = _$ProfileStateNoNetwork;
}
