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
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<CartProduct> products)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
    TResult Function(String message)? error,
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
    TResult? Function(CartStateLoad value)? load,
    TResult? Function(CartStateLoading value)? loading,
    TResult? Function(CartStateError value)? error,
    TResult? Function(CartStateNoNetwork value)? noNetwork,
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
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CartStateLoadCopyWith<$Res> {
  factory _$$CartStateLoadCopyWith(
          _$CartStateLoad value, $Res Function(_$CartStateLoad) then) =
      __$$CartStateLoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartStateLoadCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateLoad>
    implements _$$CartStateLoadCopyWith<$Res> {
  __$$CartStateLoadCopyWithImpl(
      _$CartStateLoad _value, $Res Function(_$CartStateLoad) _then)
      : super(_value, _then);
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
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<CartProduct> products)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
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
    TResult? Function(CartStateLoad value)? load,
    TResult? Function(CartStateLoading value)? loading,
    TResult? Function(CartStateError value)? error,
    TResult? Function(CartStateNoNetwork value)? noNetwork,
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
  @useResult
  $Res call({List<CartProduct> products});
}

/// @nodoc
class __$$CartStateLoadingCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateLoading>
    implements _$$CartStateLoadingCopyWith<$Res> {
  __$$CartStateLoadingCopyWithImpl(
      _$CartStateLoading _value, $Res Function(_$CartStateLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$CartStateLoading(
      products: null == products
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
  @pragma('vm:prefer-inline')
  _$$CartStateLoadingCopyWith<_$CartStateLoading> get copyWith =>
      __$$CartStateLoadingCopyWithImpl<_$CartStateLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CartProduct> products) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return loading(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<CartProduct> products)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return loading?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
    TResult Function(String message)? error,
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
    TResult? Function(CartStateLoad value)? load,
    TResult? Function(CartStateLoading value)? loading,
    TResult? Function(CartStateError value)? error,
    TResult? Function(CartStateNoNetwork value)? noNetwork,
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
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CartStateErrorCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateError>
    implements _$$CartStateErrorCopyWith<$Res> {
  __$$CartStateErrorCopyWithImpl(
      _$CartStateError _value, $Res Function(_$CartStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CartStateError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartStateError implements CartStateError {
  const _$CartStateError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CartState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateErrorCopyWith<_$CartStateError> get copyWith =>
      __$$CartStateErrorCopyWithImpl<_$CartStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(List<CartProduct> products) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<CartProduct> products)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
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
    TResult? Function(CartStateLoad value)? load,
    TResult? Function(CartStateLoading value)? loading,
    TResult? Function(CartStateError value)? error,
    TResult? Function(CartStateNoNetwork value)? noNetwork,
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
  const factory CartStateError({required final String message}) =
      _$CartStateError;

  String get message;
  @JsonKey(ignore: true)
  _$$CartStateErrorCopyWith<_$CartStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartStateNoNetworkCopyWith<$Res> {
  factory _$$CartStateNoNetworkCopyWith(_$CartStateNoNetwork value,
          $Res Function(_$CartStateNoNetwork) then) =
      __$$CartStateNoNetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartStateNoNetworkCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateNoNetwork>
    implements _$$CartStateNoNetworkCopyWith<$Res> {
  __$$CartStateNoNetworkCopyWithImpl(
      _$CartStateNoNetwork _value, $Res Function(_$CartStateNoNetwork) _then)
      : super(_value, _then);
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
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return noNetwork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(List<CartProduct> products)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return noNetwork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(List<CartProduct> products)? loading,
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
    TResult? Function(CartStateLoad value)? load,
    TResult? Function(CartStateLoading value)? loading,
    TResult? Function(CartStateError value)? error,
    TResult? Function(CartStateNoNetwork value)? noNetwork,
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
