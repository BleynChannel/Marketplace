// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CompactProduct> filterProducts) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CompactProduct> filterProducts)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CompactProduct> filterProducts)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchStateLoad value) load,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateError value) error,
    required TResult Function(SearchStateNoNetwork value) noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SearchStateLoad value)? load,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateError value)? error,
    TResult Function(SearchStateNoNetwork value)? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateLoad value)? load,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateError value)? error,
    TResult Function(SearchStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;
}

/// @nodoc
abstract class _$$SearchStateLoadCopyWith<$Res> {
  factory _$$SearchStateLoadCopyWith(
          _$SearchStateLoad value, $Res Function(_$SearchStateLoad) then) =
      __$$SearchStateLoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchStateLoadCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$$SearchStateLoadCopyWith<$Res> {
  __$$SearchStateLoadCopyWithImpl(
      _$SearchStateLoad _value, $Res Function(_$SearchStateLoad) _then)
      : super(_value, (v) => _then(v as _$SearchStateLoad));

  @override
  _$SearchStateLoad get _value => super._value as _$SearchStateLoad;
}

/// @nodoc

class _$SearchStateLoad implements SearchStateLoad {
  const _$SearchStateLoad();

  @override
  String toString() {
    return 'SearchState.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchStateLoad);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CompactProduct> filterProducts) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CompactProduct> filterProducts)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CompactProduct> filterProducts)? loading,
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
    required TResult Function(SearchStateLoad value) load,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateError value) error,
    required TResult Function(SearchStateNoNetwork value) noNetwork,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SearchStateLoad value)? load,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateError value)? error,
    TResult Function(SearchStateNoNetwork value)? noNetwork,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateLoad value)? load,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateError value)? error,
    TResult Function(SearchStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class SearchStateLoad implements SearchState {
  const factory SearchStateLoad() = _$SearchStateLoad;
}

/// @nodoc
abstract class _$$SearchStateLoadingCopyWith<$Res> {
  factory _$$SearchStateLoadingCopyWith(_$SearchStateLoading value,
          $Res Function(_$SearchStateLoading) then) =
      __$$SearchStateLoadingCopyWithImpl<$Res>;
  $Res call({List<CompactProduct> filterProducts});
}

/// @nodoc
class __$$SearchStateLoadingCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$$SearchStateLoadingCopyWith<$Res> {
  __$$SearchStateLoadingCopyWithImpl(
      _$SearchStateLoading _value, $Res Function(_$SearchStateLoading) _then)
      : super(_value, (v) => _then(v as _$SearchStateLoading));

  @override
  _$SearchStateLoading get _value => super._value as _$SearchStateLoading;

  @override
  $Res call({
    Object? filterProducts = freezed,
  }) {
    return _then(_$SearchStateLoading(
      filterProducts: filterProducts == freezed
          ? _value._filterProducts
          : filterProducts // ignore: cast_nullable_to_non_nullable
              as List<CompactProduct>,
    ));
  }
}

/// @nodoc

class _$SearchStateLoading implements SearchStateLoading {
  const _$SearchStateLoading(
      {required final List<CompactProduct> filterProducts})
      : _filterProducts = filterProducts;

  final List<CompactProduct> _filterProducts;
  @override
  List<CompactProduct> get filterProducts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterProducts);
  }

  @override
  String toString() {
    return 'SearchState.loading(filterProducts: $filterProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateLoading &&
            const DeepCollectionEquality()
                .equals(other._filterProducts, _filterProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_filterProducts));

  @JsonKey(ignore: true)
  @override
  _$$SearchStateLoadingCopyWith<_$SearchStateLoading> get copyWith =>
      __$$SearchStateLoadingCopyWithImpl<_$SearchStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CompactProduct> filterProducts) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return loading(filterProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CompactProduct> filterProducts)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return loading?.call(filterProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CompactProduct> filterProducts)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(filterProducts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchStateLoad value) load,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateError value) error,
    required TResult Function(SearchStateNoNetwork value) noNetwork,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SearchStateLoad value)? load,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateError value)? error,
    TResult Function(SearchStateNoNetwork value)? noNetwork,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateLoad value)? load,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateError value)? error,
    TResult Function(SearchStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SearchStateLoading implements SearchState {
  const factory SearchStateLoading(
          {required final List<CompactProduct> filterProducts}) =
      _$SearchStateLoading;

  List<CompactProduct> get filterProducts;
  @JsonKey(ignore: true)
  _$$SearchStateLoadingCopyWith<_$SearchStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchStateErrorCopyWith<$Res> {
  factory _$$SearchStateErrorCopyWith(
          _$SearchStateError value, $Res Function(_$SearchStateError) then) =
      __$$SearchStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchStateErrorCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$$SearchStateErrorCopyWith<$Res> {
  __$$SearchStateErrorCopyWithImpl(
      _$SearchStateError _value, $Res Function(_$SearchStateError) _then)
      : super(_value, (v) => _then(v as _$SearchStateError));

  @override
  _$SearchStateError get _value => super._value as _$SearchStateError;
}

/// @nodoc

class _$SearchStateError implements SearchStateError {
  const _$SearchStateError();

  @override
  String toString() {
    return 'SearchState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CompactProduct> filterProducts) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CompactProduct> filterProducts)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CompactProduct> filterProducts)? loading,
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
    required TResult Function(SearchStateLoad value) load,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateError value) error,
    required TResult Function(SearchStateNoNetwork value) noNetwork,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SearchStateLoad value)? load,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateError value)? error,
    TResult Function(SearchStateNoNetwork value)? noNetwork,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateLoad value)? load,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateError value)? error,
    TResult Function(SearchStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SearchStateError implements SearchState {
  const factory SearchStateError() = _$SearchStateError;
}

/// @nodoc
abstract class _$$SearchStateNoNetworkCopyWith<$Res> {
  factory _$$SearchStateNoNetworkCopyWith(_$SearchStateNoNetwork value,
          $Res Function(_$SearchStateNoNetwork) then) =
      __$$SearchStateNoNetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchStateNoNetworkCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$$SearchStateNoNetworkCopyWith<$Res> {
  __$$SearchStateNoNetworkCopyWithImpl(_$SearchStateNoNetwork _value,
      $Res Function(_$SearchStateNoNetwork) _then)
      : super(_value, (v) => _then(v as _$SearchStateNoNetwork));

  @override
  _$SearchStateNoNetwork get _value => super._value as _$SearchStateNoNetwork;
}

/// @nodoc

class _$SearchStateNoNetwork implements SearchStateNoNetwork {
  const _$SearchStateNoNetwork();

  @override
  String toString() {
    return 'SearchState.noNetwork()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchStateNoNetwork);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CompactProduct> filterProducts) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return noNetwork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CompactProduct> filterProducts)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return noNetwork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CompactProduct> filterProducts)? loading,
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
    required TResult Function(SearchStateLoad value) load,
    required TResult Function(SearchStateLoading value) loading,
    required TResult Function(SearchStateError value) error,
    required TResult Function(SearchStateNoNetwork value) noNetwork,
  }) {
    return noNetwork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SearchStateLoad value)? load,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateError value)? error,
    TResult Function(SearchStateNoNetwork value)? noNetwork,
  }) {
    return noNetwork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateLoad value)? load,
    TResult Function(SearchStateLoading value)? loading,
    TResult Function(SearchStateError value)? error,
    TResult Function(SearchStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (noNetwork != null) {
      return noNetwork(this);
    }
    return orElse();
  }
}

abstract class SearchStateNoNetwork implements SearchState {
  const factory SearchStateNoNetwork() = _$SearchStateNoNetwork;
}
