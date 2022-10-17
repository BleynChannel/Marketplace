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
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function()? error,
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
    TResult Function(DesiredStateLoad value)? load,
    TResult Function(DesiredStateLoading value)? loading,
    TResult Function(DesiredStateError value)? error,
    TResult Function(DesiredStateNoNetwork value)? noNetwork,
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
      _$DesiredStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DesiredStateCopyWithImpl<$Res> implements $DesiredStateCopyWith<$Res> {
  _$DesiredStateCopyWithImpl(this._value, this._then);

  final DesiredState _value;
  // ignore: unused_field
  final $Res Function(DesiredState) _then;
}

/// @nodoc
abstract class _$$DesiredStateLoadCopyWith<$Res> {
  factory _$$DesiredStateLoadCopyWith(
          _$DesiredStateLoad value, $Res Function(_$DesiredStateLoad) then) =
      __$$DesiredStateLoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DesiredStateLoadCopyWithImpl<$Res>
    extends _$DesiredStateCopyWithImpl<$Res>
    implements _$$DesiredStateLoadCopyWith<$Res> {
  __$$DesiredStateLoadCopyWithImpl(
      _$DesiredStateLoad _value, $Res Function(_$DesiredStateLoad) _then)
      : super(_value, (v) => _then(v as _$DesiredStateLoad));

  @override
  _$DesiredStateLoad get _value => super._value as _$DesiredStateLoad;
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
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function()? error,
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
    TResult Function(DesiredStateLoad value)? load,
    TResult Function(DesiredStateLoading value)? loading,
    TResult Function(DesiredStateError value)? error,
    TResult Function(DesiredStateNoNetwork value)? noNetwork,
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
  $Res call({List<Desired> desireds});
}

/// @nodoc
class __$$DesiredStateLoadingCopyWithImpl<$Res>
    extends _$DesiredStateCopyWithImpl<$Res>
    implements _$$DesiredStateLoadingCopyWith<$Res> {
  __$$DesiredStateLoadingCopyWithImpl(
      _$DesiredStateLoading _value, $Res Function(_$DesiredStateLoading) _then)
      : super(_value, (v) => _then(v as _$DesiredStateLoading));

  @override
  _$DesiredStateLoading get _value => super._value as _$DesiredStateLoading;

  @override
  $Res call({
    Object? desireds = freezed,
  }) {
    return _then(_$DesiredStateLoading(
      desireds: desireds == freezed
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
  _$$DesiredStateLoadingCopyWith<_$DesiredStateLoading> get copyWith =>
      __$$DesiredStateLoadingCopyWithImpl<_$DesiredStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Desired> desireds) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return loading(desireds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return loading?.call(desireds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function()? error,
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
    TResult Function(DesiredStateLoad value)? load,
    TResult Function(DesiredStateLoading value)? loading,
    TResult Function(DesiredStateError value)? error,
    TResult Function(DesiredStateNoNetwork value)? noNetwork,
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
}

/// @nodoc
class __$$DesiredStateErrorCopyWithImpl<$Res>
    extends _$DesiredStateCopyWithImpl<$Res>
    implements _$$DesiredStateErrorCopyWith<$Res> {
  __$$DesiredStateErrorCopyWithImpl(
      _$DesiredStateError _value, $Res Function(_$DesiredStateError) _then)
      : super(_value, (v) => _then(v as _$DesiredStateError));

  @override
  _$DesiredStateError get _value => super._value as _$DesiredStateError;
}

/// @nodoc

class _$DesiredStateError implements DesiredStateError {
  const _$DesiredStateError();

  @override
  String toString() {
    return 'DesiredState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DesiredStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<Desired> desireds) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
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
    TResult Function(DesiredStateLoad value)? load,
    TResult Function(DesiredStateLoading value)? loading,
    TResult Function(DesiredStateError value)? error,
    TResult Function(DesiredStateNoNetwork value)? noNetwork,
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
  const factory DesiredStateError() = _$DesiredStateError;
}

/// @nodoc
abstract class _$$DesiredStateNoNetworkCopyWith<$Res> {
  factory _$$DesiredStateNoNetworkCopyWith(_$DesiredStateNoNetwork value,
          $Res Function(_$DesiredStateNoNetwork) then) =
      __$$DesiredStateNoNetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DesiredStateNoNetworkCopyWithImpl<$Res>
    extends _$DesiredStateCopyWithImpl<$Res>
    implements _$$DesiredStateNoNetworkCopyWith<$Res> {
  __$$DesiredStateNoNetworkCopyWithImpl(_$DesiredStateNoNetwork _value,
      $Res Function(_$DesiredStateNoNetwork) _then)
      : super(_value, (v) => _then(v as _$DesiredStateNoNetwork));

  @override
  _$DesiredStateNoNetwork get _value => super._value as _$DesiredStateNoNetwork;
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
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return noNetwork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return noNetwork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<Desired> desireds)? loading,
    TResult Function()? error,
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
    TResult Function(DesiredStateLoad value)? load,
    TResult Function(DesiredStateLoading value)? loading,
    TResult Function(DesiredStateError value)? error,
    TResult Function(DesiredStateNoNetwork value)? noNetwork,
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
