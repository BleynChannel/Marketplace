// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_dlc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductDLC {
  String get title => throw _privateConstructorUsedError;
  Price get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDLCCopyWith<ProductDLC> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDLCCopyWith<$Res> {
  factory $ProductDLCCopyWith(
          ProductDLC value, $Res Function(ProductDLC) then) =
      _$ProductDLCCopyWithImpl<$Res>;
  $Res call({String title, Price price});

  $PriceCopyWith<$Res> get price;
}

/// @nodoc
class _$ProductDLCCopyWithImpl<$Res> implements $ProductDLCCopyWith<$Res> {
  _$ProductDLCCopyWithImpl(this._value, this._then);

  final ProductDLC _value;
  // ignore: unused_field
  final $Res Function(ProductDLC) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? price = freezed,
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
abstract class _$$_ProductDLCCopyWith<$Res>
    implements $ProductDLCCopyWith<$Res> {
  factory _$$_ProductDLCCopyWith(
          _$_ProductDLC value, $Res Function(_$_ProductDLC) then) =
      __$$_ProductDLCCopyWithImpl<$Res>;
  @override
  $Res call({String title, Price price});

  @override
  $PriceCopyWith<$Res> get price;
}

/// @nodoc
class __$$_ProductDLCCopyWithImpl<$Res> extends _$ProductDLCCopyWithImpl<$Res>
    implements _$$_ProductDLCCopyWith<$Res> {
  __$$_ProductDLCCopyWithImpl(
      _$_ProductDLC _value, $Res Function(_$_ProductDLC) _then)
      : super(_value, (v) => _then(v as _$_ProductDLC));

  @override
  _$_ProductDLC get _value => super._value as _$_ProductDLC;

  @override
  $Res call({
    Object? title = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_ProductDLC(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
    ));
  }
}

/// @nodoc

class _$_ProductDLC implements _ProductDLC {
  const _$_ProductDLC({required this.title, required this.price});

  @override
  final String title;
  @override
  final Price price;

  @override
  String toString() {
    return 'ProductDLC(title: $title, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDLC &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$$_ProductDLCCopyWith<_$_ProductDLC> get copyWith =>
      __$$_ProductDLCCopyWithImpl<_$_ProductDLC>(this, _$identity);
}

abstract class _ProductDLC implements ProductDLC {
  const factory _ProductDLC(
      {required final String title,
      required final Price price}) = _$_ProductDLC;

  @override
  String get title;
  @override
  Price get price;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDLCCopyWith<_$_ProductDLC> get copyWith =>
      throw _privateConstructorUsedError;
}
