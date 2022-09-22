// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'compact_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompactProduct {
  String get title => throw _privateConstructorUsedError;
  Media get banner => throw _privateConstructorUsedError;
  Price get price => throw _privateConstructorUsedError;
  List<Platform> get platforms => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompactProductCopyWith<CompactProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompactProductCopyWith<$Res> {
  factory $CompactProductCopyWith(
          CompactProduct value, $Res Function(CompactProduct) then) =
      _$CompactProductCopyWithImpl<$Res>;
  $Res call(
      {String title, Media banner, Price price, List<Platform> platforms});

  $MediaCopyWith<$Res> get banner;
  $PriceCopyWith<$Res> get price;
}

/// @nodoc
class _$CompactProductCopyWithImpl<$Res>
    implements $CompactProductCopyWith<$Res> {
  _$CompactProductCopyWithImpl(this._value, this._then);

  final CompactProduct _value;
  // ignore: unused_field
  final $Res Function(CompactProduct) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? banner = freezed,
    Object? price = freezed,
    Object? platforms = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      banner: banner == freezed
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as Media,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      platforms: platforms == freezed
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<Platform>,
    ));
  }

  @override
  $MediaCopyWith<$Res> get banner {
    return $MediaCopyWith<$Res>(_value.banner, (value) {
      return _then(_value.copyWith(banner: value));
    });
  }

  @override
  $PriceCopyWith<$Res> get price {
    return $PriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value));
    });
  }
}

/// @nodoc
abstract class _$$_CompactProductCopyWith<$Res>
    implements $CompactProductCopyWith<$Res> {
  factory _$$_CompactProductCopyWith(
          _$_CompactProduct value, $Res Function(_$_CompactProduct) then) =
      __$$_CompactProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title, Media banner, Price price, List<Platform> platforms});

  @override
  $MediaCopyWith<$Res> get banner;
  @override
  $PriceCopyWith<$Res> get price;
}

/// @nodoc
class __$$_CompactProductCopyWithImpl<$Res>
    extends _$CompactProductCopyWithImpl<$Res>
    implements _$$_CompactProductCopyWith<$Res> {
  __$$_CompactProductCopyWithImpl(
      _$_CompactProduct _value, $Res Function(_$_CompactProduct) _then)
      : super(_value, (v) => _then(v as _$_CompactProduct));

  @override
  _$_CompactProduct get _value => super._value as _$_CompactProduct;

  @override
  $Res call({
    Object? title = freezed,
    Object? banner = freezed,
    Object? price = freezed,
    Object? platforms = freezed,
  }) {
    return _then(_$_CompactProduct(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      banner: banner == freezed
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as Media,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      platforms: platforms == freezed
          ? _value._platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<Platform>,
    ));
  }
}

/// @nodoc

class _$_CompactProduct extends _CompactProduct {
  const _$_CompactProduct(
      {required this.title,
      required this.banner,
      required this.price,
      required final List<Platform> platforms})
      : _platforms = platforms,
        super._();

  @override
  final String title;
  @override
  final Media banner;
  @override
  final Price price;
  final List<Platform> _platforms;
  @override
  List<Platform> get platforms {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_platforms);
  }

  @override
  String toString() {
    return 'CompactProduct(title: $title, banner: $banner, price: $price, platforms: $platforms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompactProduct &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.banner, banner) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other._platforms, _platforms));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(banner),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(_platforms));

  @JsonKey(ignore: true)
  @override
  _$$_CompactProductCopyWith<_$_CompactProduct> get copyWith =>
      __$$_CompactProductCopyWithImpl<_$_CompactProduct>(this, _$identity);
}

abstract class _CompactProduct extends CompactProduct {
  const factory _CompactProduct(
      {required final String title,
      required final Media banner,
      required final Price price,
      required final List<Platform> platforms}) = _$_CompactProduct;
  const _CompactProduct._() : super._();

  @override
  String get title;
  @override
  Media get banner;
  @override
  Price get price;
  @override
  List<Platform> get platforms;
  @override
  @JsonKey(ignore: true)
  _$$_CompactProductCopyWith<_$_CompactProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
