// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'desired_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DesiredState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Desired> desireds) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Desired> desireds)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DesiredStateLoad value) load,
    required TResult Function(DesiredStateLoading value) loading,
    required TResult Function(DesiredStateError value) error,
    required TResult Function(DesiredStateNoNetwork value) noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DesiredStateLoad value)? load,
    TResult? Function(DesiredStateLoading value)? loading,
    TResult? Function(DesiredStateError value)? error,
    TResult? Function(DesiredStateNoNetwork value)? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DesiredStateLoad value)? load,
    TResult Function(DesiredStateLoading value)? loading,
    TResult Function(DesiredStateError value)? error,
    TResult Function(DesiredStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesiredStateCopyWith<$Res> {
  factory $DesiredStateCopyWith(
          DesiredState value, $Res Function(DesiredState) then) =
      _$DesiredStateCopyWithImpl<$Res, DesiredState>;
}

/// @nodoc
class _$DesiredStateCopyWithImpl<$Res, $Val extends DesiredState>
    implements $DesiredStateCopyWith<$Res> {
  _$DesiredStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DesiredStateLoadCopyWith<$Res> {
  factory _$$DesiredStateLoadCopyWith(
          _$DesiredStateLoad value, $Res Function(_$DesiredStateLoad) then) =
      __$$DesiredStateLoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DesiredStateLoadCopyWithImpl<$Res>
    extends _$DesiredStateCopyWithImpl<$Res, _$DesiredStateLoad>
    implements _$$DesiredStateLoadCopyWith<$Res> {
  __$$DesiredStateLoadCopyWithImpl(
      _$DesiredStateLoad _value, $Res Function(_$DesiredStateLoad) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DesiredStateLoad implements DesiredStateLoad {
  const _$DesiredStateLoad();

  @override
  String toString() {
    return 'DesiredState.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DesiredStateLoad);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Desired> desireds) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Desired> desireds)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
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
    required TResult Function(DesiredStateLoad value) load,
    required TResult Function(DesiredStateLoading value) loading,
    required TResult Function(DesiredStateError value) error,
    required TResult Function(DesiredStateNoNetwork value) noNetwork,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DesiredStateLoad value)? load,
    TResult? Function(DesiredStateLoading value)? loading,
    TResult? Function(DesiredStateError value)? error,
    TResult? Function(DesiredStateNoNetwork value)? noNetwork,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DesiredStateLoad value)? load,
    TResult Function(DesiredStateLoading value)? loading,
    TResult Function(DesiredStateError value)? error,
    TResult Function(DesiredStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class DesiredStateLoad implements DesiredState {
  const factory DesiredStateLoad() = _$DesiredStateLoad;
}

/// @nodoc
abstract class _$$DesiredStateLoadingCopyWith<$Res> {
  factory _$$DesiredStateLoadingCopyWith(_$DesiredStateLoading value,
          $Res Function(_$DesiredStateLoading) then) =
      __$$DesiredStateLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Desired> desireds});
}

/// @nodoc
class __$$DesiredStateLoadingCopyWithImpl<$Res>
    extends _$DesiredStateCopyWithImpl<$Res, _$DesiredStateLoading>
    implements _$$DesiredStateLoadingCopyWith<$Res> {
  __$$DesiredStateLoadingCopyWithImpl(
      _$DesiredStateLoading _value, $Res Function(_$DesiredStateLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? desireds = null,
  }) {
    return _then(_$DesiredStateLoading(
      desireds: null == desireds
          ? _value._desireds
          : desireds // ignore: cast_nullable_to_non_nullable
              as List<Desired>,
    ));
  }
}

/// @nodoc

class _$DesiredStateLoading implements DesiredStateLoading {
  const _$DesiredStateLoading({required final List<Desired> desireds})
      : _desireds = desireds;

  final List<Desired> _desireds;
  @override
  List<Desired> get desireds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_desireds);
  }

  @override
  String toString() {
    return 'DesiredState.loading(desireds: $desireds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesiredStateLoading &&
            const DeepCollectionEquality().equals(other._desireds, _desireds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_desireds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DesiredStateLoadingCopyWith<_$DesiredStateLoading> get copyWith =>
      __$$DesiredStateLoadingCopyWithImpl<_$DesiredStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Desired> desireds) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return loading(desireds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Desired> desireds)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return loading?.call(desireds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(desireds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DesiredStateLoad value) load,
    required TResult Function(DesiredStateLoading value) loading,
    required TResult Function(DesiredStateError value) error,
    required TResult Function(DesiredStateNoNetwork value) noNetwork,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DesiredStateLoad value)? load,
    TResult? Function(DesiredStateLoading value)? loading,
    TResult? Function(DesiredStateError value)? error,
    TResult? Function(DesiredStateNoNetwork value)? noNetwork,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DesiredStateLoad value)? load,
    TResult Function(DesiredStateLoading value)? loading,
    TResult Function(DesiredStateError value)? error,
    TResult Function(DesiredStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DesiredStateLoading implements DesiredState {
  const factory DesiredStateLoading({required final List<Desired> desireds}) =
      _$DesiredStateLoading;

  List<Desired> get desireds;
  @JsonKey(ignore: true)
  _$$DesiredStateLoadingCopyWith<_$DesiredStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DesiredStateErrorCopyWith<$Res> {
  factory _$$DesiredStateErrorCopyWith(
          _$DesiredStateError value, $Res Function(_$DesiredStateError) then) =
      __$$DesiredStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DesiredStateErrorCopyWithImpl<$Res>
    extends _$DesiredStateCopyWithImpl<$Res, _$DesiredStateError>
    implements _$$DesiredStateErrorCopyWith<$Res> {
  __$$DesiredStateErrorCopyWithImpl(
      _$DesiredStateError _value, $Res Function(_$DesiredStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DesiredStateError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DesiredStateError implements DesiredStateError {
  const _$DesiredStateError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DesiredState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesiredStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DesiredStateErrorCopyWith<_$DesiredStateError> get copyWith =>
      __$$DesiredStateErrorCopyWithImpl<_$DesiredStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Desired> desireds) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Desired> desireds)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
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
    required TResult Function(DesiredStateLoad value) load,
    required TResult Function(DesiredStateLoading value) loading,
    required TResult Function(DesiredStateError value) error,
    required TResult Function(DesiredStateNoNetwork value) noNetwork,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DesiredStateLoad value)? load,
    TResult? Function(DesiredStateLoading value)? loading,
    TResult? Function(DesiredStateError value)? error,
    TResult? Function(DesiredStateNoNetwork value)? noNetwork,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DesiredStateLoad value)? load,
    TResult Function(DesiredStateLoading value)? loading,
    TResult Function(DesiredStateError value)? error,
    TResult Function(DesiredStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DesiredStateError implements DesiredState {
  const factory DesiredStateError({required final String message}) =
      _$DesiredStateError;

  String get message;
  @JsonKey(ignore: true)
  _$$DesiredStateErrorCopyWith<_$DesiredStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DesiredStateNoNetworkCopyWith<$Res> {
  factory _$$DesiredStateNoNetworkCopyWith(_$DesiredStateNoNetwork value,
          $Res Function(_$DesiredStateNoNetwork) then) =
      __$$DesiredStateNoNetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DesiredStateNoNetworkCopyWithImpl<$Res>
    extends _$DesiredStateCopyWithImpl<$Res, _$DesiredStateNoNetwork>
    implements _$$DesiredStateNoNetworkCopyWith<$Res> {
  __$$DesiredStateNoNetworkCopyWithImpl(_$DesiredStateNoNetwork _value,
      $Res Function(_$DesiredStateNoNetwork) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DesiredStateNoNetwork implements DesiredStateNoNetwork {
  const _$DesiredStateNoNetwork();

  @override
  String toString() {
    return 'DesiredState.noNetwork()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DesiredStateNoNetwork);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Desired> desireds) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return noNetwork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<Desired> desireds)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return noNetwork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
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
    required TResult Function(DesiredStateLoad value) load,
    required TResult Function(DesiredStateLoading value) loading,
    required TResult Function(DesiredStateError value) error,
    required TResult Function(DesiredStateNoNetwork value) noNetwork,
  }) {
    return noNetwork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DesiredStateLoad value)? load,
    TResult? Function(DesiredStateLoading value)? loading,
    TResult? Function(DesiredStateError value)? error,
    TResult? Function(DesiredStateNoNetwork value)? noNetwork,
  }) {
    return noNetwork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DesiredStateLoad value)? load,
    TResult Function(DesiredStateLoading value)? loading,
    TResult Function(DesiredStateError value)? error,
    TResult Function(DesiredStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (noNetwork != null) {
      return noNetwork(this);
    }
    return orElse();
  }
}

abstract class DesiredStateNoNetwork implements DesiredState {
  const factory DesiredStateNoNetwork() = _$DesiredStateNoNetwork;
}
