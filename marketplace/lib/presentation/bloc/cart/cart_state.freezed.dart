// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CartProduct> products) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStateLoad value) load,
    required TResult Function(CartStateLoading value) loading,
    required TResult Function(CartStateError value) error,
    required TResult Function(CartStateNoNetwork value) noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStateLoad value)? load,
    TResult Function(CartStateLoading value)? loading,
    TResult Function(CartStateError value)? error,
    TResult Function(CartStateNoNetwork value)? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStateLoad value)? load,
    TResult Function(CartStateLoading value)? loading,
    TResult Function(CartStateError value)? error,
    TResult Function(CartStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  final CartState _value;
  // ignore: unused_field
  final $Res Function(CartState) _then;
}

/// @nodoc
abstract class _$$CartStateLoadCopyWith<$Res> {
  factory _$$CartStateLoadCopyWith(
          _$CartStateLoad value, $Res Function(_$CartStateLoad) then) =
      __$$CartStateLoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartStateLoadCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$$CartStateLoadCopyWith<$Res> {
  __$$CartStateLoadCopyWithImpl(
      _$CartStateLoad _value, $Res Function(_$CartStateLoad) _then)
      : super(_value, (v) => _then(v as _$CartStateLoad));

  @override
  _$CartStateLoad get _value => super._value as _$CartStateLoad;
}

/// @nodoc

class _$CartStateLoad implements CartStateLoad {
  const _$CartStateLoad();

  @override
  String toString() {
    return 'CartState.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartStateLoad);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CartProduct> products) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
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
    required TResult Function(CartStateLoad value) load,
    required TResult Function(CartStateLoading value) loading,
    required TResult Function(CartStateError value) error,
    required TResult Function(CartStateNoNetwork value) noNetwork,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStateLoad value)? load,
    TResult Function(CartStateLoading value)? loading,
    TResult Function(CartStateError value)? error,
    TResult Function(CartStateNoNetwork value)? noNetwork,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStateLoad value)? load,
    TResult Function(CartStateLoading value)? loading,
    TResult Function(CartStateError value)? error,
    TResult Function(CartStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class CartStateLoad implements CartState {
  const factory CartStateLoad() = _$CartStateLoad;
}

/// @nodoc
abstract class _$$CartStateLoadingCopyWith<$Res> {
  factory _$$CartStateLoadingCopyWith(
          _$CartStateLoading value, $Res Function(_$CartStateLoading) then) =
      __$$CartStateLoadingCopyWithImpl<$Res>;
  $Res call({List<CartProduct> products});
}

/// @nodoc
class __$$CartStateLoadingCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res>
    implements _$$CartStateLoadingCopyWith<$Res> {
  __$$CartStateLoadingCopyWithImpl(
      _$CartStateLoading _value, $Res Function(_$CartStateLoading) _then)
      : super(_value, (v) => _then(v as _$CartStateLoading));

  @override
  _$CartStateLoading get _value => super._value as _$CartStateLoading;

  @override
  $Res call({
    Object? products = freezed,
  }) {
    return _then(_$CartStateLoading(
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CartProduct>,
    ));
  }
}

/// @nodoc

class _$CartStateLoading implements CartStateLoading {
  const _$CartStateLoading({required final List<CartProduct> products})
      : _products = products;

  final List<CartProduct> _products;
  @override
  List<CartProduct> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CartState.loading(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateLoading &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  _$$CartStateLoadingCopyWith<_$CartStateLoading> get copyWith =>
      __$$CartStateLoadingCopyWithImpl<_$CartStateLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CartProduct> products) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return loading(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return loading?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartStateLoad value) load,
    required TResult Function(CartStateLoading value) loading,
    required TResult Function(CartStateError value) error,
    required TResult Function(CartStateNoNetwork value) noNetwork,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStateLoad value)? load,
    TResult Function(CartStateLoading value)? loading,
    TResult Function(CartStateError value)? error,
    TResult Function(CartStateNoNetwork value)? noNetwork,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStateLoad value)? load,
    TResult Function(CartStateLoading value)? loading,
    TResult Function(CartStateError value)? error,
    TResult Function(CartStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CartStateLoading implements CartState {
  const factory CartStateLoading({required final List<CartProduct> products}) =
      _$CartStateLoading;

  List<CartProduct> get products;
  @JsonKey(ignore: true)
  _$$CartStateLoadingCopyWith<_$CartStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartStateErrorCopyWith<$Res> {
  factory _$$CartStateErrorCopyWith(
          _$CartStateError value, $Res Function(_$CartStateError) then) =
      __$$CartStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartStateErrorCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$$CartStateErrorCopyWith<$Res> {
  __$$CartStateErrorCopyWithImpl(
      _$CartStateError _value, $Res Function(_$CartStateError) _then)
      : super(_value, (v) => _then(v as _$CartStateError));

  @override
  _$CartStateError get _value => super._value as _$CartStateError;
}

/// @nodoc

class _$CartStateError implements CartStateError {
  const _$CartStateError();

  @override
  String toString() {
    return 'CartState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CartProduct> products) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
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
    required TResult Function(CartStateLoad value) load,
    required TResult Function(CartStateLoading value) loading,
    required TResult Function(CartStateError value) error,
    required TResult Function(CartStateNoNetwork value) noNetwork,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStateLoad value)? load,
    TResult Function(CartStateLoading value)? loading,
    TResult Function(CartStateError value)? error,
    TResult Function(CartStateNoNetwork value)? noNetwork,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStateLoad value)? load,
    TResult Function(CartStateLoading value)? loading,
    TResult Function(CartStateError value)? error,
    TResult Function(CartStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CartStateError implements CartState {
  const factory CartStateError() = _$CartStateError;
}

/// @nodoc
abstract class _$$CartStateNoNetworkCopyWith<$Res> {
  factory _$$CartStateNoNetworkCopyWith(_$CartStateNoNetwork value,
          $Res Function(_$CartStateNoNetwork) then) =
      __$$CartStateNoNetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartStateNoNetworkCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res>
    implements _$$CartStateNoNetworkCopyWith<$Res> {
  __$$CartStateNoNetworkCopyWithImpl(
      _$CartStateNoNetwork _value, $Res Function(_$CartStateNoNetwork) _then)
      : super(_value, (v) => _then(v as _$CartStateNoNetwork));

  @override
  _$CartStateNoNetwork get _value => super._value as _$CartStateNoNetwork;
}

/// @nodoc

class _$CartStateNoNetwork implements CartStateNoNetwork {
  const _$CartStateNoNetwork();

  @override
  String toString() {
    return 'CartState.noNetwork()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartStateNoNetwork);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CartProduct> products) loading,
    required TResult Function() error,
    required TResult Function() noNetwork,
  }) {
    return noNetwork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
    TResult Function()? error,
    TResult Function()? noNetwork,
  }) {
    return noNetwork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
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
    required TResult Function(CartStateLoad value) load,
    required TResult Function(CartStateLoading value) loading,
    required TResult Function(CartStateError value) error,
    required TResult Function(CartStateNoNetwork value) noNetwork,
  }) {
    return noNetwork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartStateLoad value)? load,
    TResult Function(CartStateLoading value)? loading,
    TResult Function(CartStateError value)? error,
    TResult Function(CartStateNoNetwork value)? noNetwork,
  }) {
    return noNetwork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartStateLoad value)? load,
    TResult Function(CartStateLoading value)? loading,
    TResult Function(CartStateError value)? error,
    TResult Function(CartStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (noNetwork != null) {
      return noNetwork(this);
    }
    return orElse();
  }
}

abstract class CartStateNoNetwork implements CartState {
  const factory CartStateNoNetwork() = _$CartStateNoNetwork;
}
