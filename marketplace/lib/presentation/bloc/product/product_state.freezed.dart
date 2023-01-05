// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Product product) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Product product)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Product product)? loading,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductStateLoad value) load,
    required TResult Function(ProductStateLoading value) loading,
    required TResult Function(ProductStateError value) error,
    required TResult Function(ProductStateNoNetwork value) noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductStateLoad value)? load,
    TResult? Function(ProductStateLoading value)? loading,
    TResult? Function(ProductStateError value)? error,
    TResult? Function(ProductStateNoNetwork value)? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductStateLoad value)? load,
    TResult Function(ProductStateLoading value)? loading,
    TResult Function(ProductStateError value)? error,
    TResult Function(ProductStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductStateLoadCopyWith<$Res> {
  factory _$$ProductStateLoadCopyWith(
          _$ProductStateLoad value, $Res Function(_$ProductStateLoad) then) =
      __$$ProductStateLoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductStateLoadCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductStateLoad>
    implements _$$ProductStateLoadCopyWith<$Res> {
  __$$ProductStateLoadCopyWithImpl(
      _$ProductStateLoad _value, $Res Function(_$ProductStateLoad) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductStateLoad implements ProductStateLoad {
  const _$ProductStateLoad();

  @override
  String toString() {
    return 'ProductState.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProductStateLoad);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Product product) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Product product)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Product product)? loading,
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
    required TResult Function(ProductStateLoad value) load,
    required TResult Function(ProductStateLoading value) loading,
    required TResult Function(ProductStateError value) error,
    required TResult Function(ProductStateNoNetwork value) noNetwork,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductStateLoad value)? load,
    TResult? Function(ProductStateLoading value)? loading,
    TResult? Function(ProductStateError value)? error,
    TResult? Function(ProductStateNoNetwork value)? noNetwork,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductStateLoad value)? load,
    TResult Function(ProductStateLoading value)? loading,
    TResult Function(ProductStateError value)? error,
    TResult Function(ProductStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class ProductStateLoad implements ProductState {
  const factory ProductStateLoad() = _$ProductStateLoad;
}

/// @nodoc
abstract class _$$ProductStateLoadingCopyWith<$Res> {
  factory _$$ProductStateLoadingCopyWith(_$ProductStateLoading value,
          $Res Function(_$ProductStateLoading) then) =
      __$$ProductStateLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductStateLoadingCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductStateLoading>
    implements _$$ProductStateLoadingCopyWith<$Res> {
  __$$ProductStateLoadingCopyWithImpl(
      _$ProductStateLoading _value, $Res Function(_$ProductStateLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$ProductStateLoading(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$ProductStateLoading implements ProductStateLoading {
  const _$ProductStateLoading({required this.product});

  @override
  final Product product;

  @override
  String toString() {
    return 'ProductState.loading(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStateLoading &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStateLoadingCopyWith<_$ProductStateLoading> get copyWith =>
      __$$ProductStateLoadingCopyWithImpl<_$ProductStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Product product) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return loading(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Product product)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return loading?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Product product)? loading,
    TResult Function(String message)? error,
    TResult Function()? noNetwork,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductStateLoad value) load,
    required TResult Function(ProductStateLoading value) loading,
    required TResult Function(ProductStateError value) error,
    required TResult Function(ProductStateNoNetwork value) noNetwork,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductStateLoad value)? load,
    TResult? Function(ProductStateLoading value)? loading,
    TResult? Function(ProductStateError value)? error,
    TResult? Function(ProductStateNoNetwork value)? noNetwork,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductStateLoad value)? load,
    TResult Function(ProductStateLoading value)? loading,
    TResult Function(ProductStateError value)? error,
    TResult Function(ProductStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProductStateLoading implements ProductState {
  const factory ProductStateLoading({required final Product product}) =
      _$ProductStateLoading;

  Product get product;
  @JsonKey(ignore: true)
  _$$ProductStateLoadingCopyWith<_$ProductStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductStateErrorCopyWith<$Res> {
  factory _$$ProductStateErrorCopyWith(
          _$ProductStateError value, $Res Function(_$ProductStateError) then) =
      __$$ProductStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ProductStateErrorCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductStateError>
    implements _$$ProductStateErrorCopyWith<$Res> {
  __$$ProductStateErrorCopyWithImpl(
      _$ProductStateError _value, $Res Function(_$ProductStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ProductStateError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductStateError implements ProductStateError {
  const _$ProductStateError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ProductState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStateErrorCopyWith<_$ProductStateError> get copyWith =>
      __$$ProductStateErrorCopyWithImpl<_$ProductStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Product product) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Product product)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Product product)? loading,
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
    required TResult Function(ProductStateLoad value) load,
    required TResult Function(ProductStateLoading value) loading,
    required TResult Function(ProductStateError value) error,
    required TResult Function(ProductStateNoNetwork value) noNetwork,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductStateLoad value)? load,
    TResult? Function(ProductStateLoading value)? loading,
    TResult? Function(ProductStateError value)? error,
    TResult? Function(ProductStateNoNetwork value)? noNetwork,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductStateLoad value)? load,
    TResult Function(ProductStateLoading value)? loading,
    TResult Function(ProductStateError value)? error,
    TResult Function(ProductStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProductStateError implements ProductState {
  const factory ProductStateError({required final String message}) =
      _$ProductStateError;

  String get message;
  @JsonKey(ignore: true)
  _$$ProductStateErrorCopyWith<_$ProductStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductStateNoNetworkCopyWith<$Res> {
  factory _$$ProductStateNoNetworkCopyWith(_$ProductStateNoNetwork value,
          $Res Function(_$ProductStateNoNetwork) then) =
      __$$ProductStateNoNetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductStateNoNetworkCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductStateNoNetwork>
    implements _$$ProductStateNoNetworkCopyWith<$Res> {
  __$$ProductStateNoNetworkCopyWithImpl(_$ProductStateNoNetwork _value,
      $Res Function(_$ProductStateNoNetwork) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductStateNoNetwork implements ProductStateNoNetwork {
  const _$ProductStateNoNetwork();

  @override
  String toString() {
    return 'ProductState.noNetwork()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProductStateNoNetwork);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Product product) loading,
    required TResult Function(String message) error,
    required TResult Function() noNetwork,
  }) {
    return noNetwork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Product product)? loading,
    TResult? Function(String message)? error,
    TResult? Function()? noNetwork,
  }) {
    return noNetwork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Product product)? loading,
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
    required TResult Function(ProductStateLoad value) load,
    required TResult Function(ProductStateLoading value) loading,
    required TResult Function(ProductStateError value) error,
    required TResult Function(ProductStateNoNetwork value) noNetwork,
  }) {
    return noNetwork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductStateLoad value)? load,
    TResult? Function(ProductStateLoading value)? loading,
    TResult? Function(ProductStateError value)? error,
    TResult? Function(ProductStateNoNetwork value)? noNetwork,
  }) {
    return noNetwork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductStateLoad value)? load,
    TResult Function(ProductStateLoading value)? loading,
    TResult Function(ProductStateError value)? error,
    TResult Function(ProductStateNoNetwork value)? noNetwork,
    required TResult orElse(),
  }) {
    if (noNetwork != null) {
      return noNetwork(this);
    }
    return orElse();
  }
}

abstract class ProductStateNoNetwork implements ProductState {
  const factory ProductStateNoNetwork() = _$ProductStateNoNetwork;
}
