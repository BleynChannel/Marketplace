// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartProduct {
  CompactProduct get product => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartProductCopyWith<CartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductCopyWith<$Res> {
  factory $CartProductCopyWith(
          CartProduct value, $Res Function(CartProduct) then) =
      _$CartProductCopyWithImpl<$Res>;
  $Res call({CompactProduct product, int count});

  $CompactProductCopyWith<$Res> get product;
}

/// @nodoc
class _$CartProductCopyWithImpl<$Res> implements $CartProductCopyWith<$Res> {
  _$CartProductCopyWithImpl(this._value, this._then);

  final CartProduct _value;
  // ignore: unused_field
  final $Res Function(CartProduct) _then;

  @override
  $Res call({
    Object? product = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as CompactProduct,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $CompactProductCopyWith<$Res> get product {
    return $CompactProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$$_CartProductCopyWith<$Res>
    implements $CartProductCopyWith<$Res> {
  factory _$$_CartProductCopyWith(
          _$_CartProduct value, $Res Function(_$_CartProduct) then) =
      __$$_CartProductCopyWithImpl<$Res>;
  @override
  $Res call({CompactProduct product, int count});

  @override
  $CompactProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_CartProductCopyWithImpl<$Res> extends _$CartProductCopyWithImpl<$Res>
    implements _$$_CartProductCopyWith<$Res> {
  __$$_CartProductCopyWithImpl(
      _$_CartProduct _value, $Res Function(_$_CartProduct) _then)
      : super(_value, (v) => _then(v as _$_CartProduct));

  @override
  _$_CartProduct get _value => super._value as _$_CartProduct;

  @override
  $Res call({
    Object? product = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_CartProduct(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as CompactProduct,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CartProduct implements _CartProduct {
  const _$_CartProduct({required this.product, required this.count});

  @override
  final CompactProduct product;
  @override
  final int count;

  @override
  String toString() {
    return 'CartProduct(product: $product, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartProduct &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_CartProductCopyWith<_$_CartProduct> get copyWith =>
      __$$_CartProductCopyWithImpl<_$_CartProduct>(this, _$identity);
}

abstract class _CartProduct implements CartProduct {
  const factory _CartProduct(
      {required final CompactProduct product,
      required final int count}) = _$_CartProduct;

  @override
  CompactProduct get product;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_CartProductCopyWith<_$_CartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}