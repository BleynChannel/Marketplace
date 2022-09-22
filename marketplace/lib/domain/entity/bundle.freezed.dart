// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Bundle {
  String get title => throw _privateConstructorUsedError;
  Price get price => throw _privateConstructorUsedError;
  List<CompactProduct> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BundleCopyWith<Bundle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleCopyWith<$Res> {
  factory $BundleCopyWith(Bundle value, $Res Function(Bundle) then) =
      _$BundleCopyWithImpl<$Res>;
  $Res call({String title, Price price, List<CompactProduct> products});

  $PriceCopyWith<$Res> get price;
}

/// @nodoc
class _$BundleCopyWithImpl<$Res> implements $BundleCopyWith<$Res> {
  _$BundleCopyWithImpl(this._value, this._then);

  final Bundle _value;
  // ignore: unused_field
  final $Res Function(Bundle) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? price = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CompactProduct>,
    ));
  }

  @override
  $PriceCopyWith<$Res> get price {
    return $PriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value));
    });
  }
}

/// @nodoc
abstract class _$$_BundleCopyWith<$Res> implements $BundleCopyWith<$Res> {
  factory _$$_BundleCopyWith(_$_Bundle value, $Res Function(_$_Bundle) then) =
      __$$_BundleCopyWithImpl<$Res>;
  @override
  $Res call({String title, Price price, List<CompactProduct> products});

  @override
  $PriceCopyWith<$Res> get price;
}

/// @nodoc
class __$$_BundleCopyWithImpl<$Res> extends _$BundleCopyWithImpl<$Res>
    implements _$$_BundleCopyWith<$Res> {
  __$$_BundleCopyWithImpl(_$_Bundle _value, $Res Function(_$_Bundle) _then)
      : super(_value, (v) => _then(v as _$_Bundle));

  @override
  _$_Bundle get _value => super._value as _$_Bundle;

  @override
  $Res call({
    Object? title = freezed,
    Object? price = freezed,
    Object? products = freezed,
  }) {
    return _then(_$_Bundle(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CompactProduct>,
    ));
  }
}

/// @nodoc

class _$_Bundle implements _Bundle {
  const _$_Bundle(
      {required this.title,
      required this.price,
      required final List<CompactProduct> products})
      : _products = products;

  @override
  final String title;
  @override
  final Price price;
  final List<CompactProduct> _products;
  @override
  List<CompactProduct> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'Bundle(title: $title, price: $price, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bundle &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  _$$_BundleCopyWith<_$_Bundle> get copyWith =>
      __$$_BundleCopyWithImpl<_$_Bundle>(this, _$identity);
}

abstract class _Bundle implements Bundle {
  const factory _Bundle(
      {required final String title,
      required final Price price,
      required final List<CompactProduct> products}) = _$_Bundle;

  @override
  String get title;
  @override
  Price get price;
  @override
  List<CompactProduct> get products;
  @override
  @JsonKey(ignore: true)
  _$$_BundleCopyWith<_$_Bundle> get copyWith =>
      throw _privateConstructorUsedError;
}
