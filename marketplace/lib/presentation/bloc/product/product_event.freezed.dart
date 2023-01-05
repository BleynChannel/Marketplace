// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductEvent {
  CompactProduct get compactProduct => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CompactProduct compactProduct) onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CompactProduct compactProduct)? onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CompactProduct compactProduct)? onLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductOnLoaded value) onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductOnLoaded value)? onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductOnLoaded value)? onLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductEventCopyWith<ProductEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res, ProductEvent>;
  @useResult
  $Res call({CompactProduct compactProduct});

  $CompactProductCopyWith<$Res> get compactProduct;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res, $Val extends ProductEvent>
    implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compactProduct = null,
  }) {
    return _then(_value.copyWith(
      compactProduct: null == compactProduct
          ? _value.compactProduct
          : compactProduct // ignore: cast_nullable_to_non_nullable
              as CompactProduct,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompactProductCopyWith<$Res> get compactProduct {
    return $CompactProductCopyWith<$Res>(_value.compactProduct, (value) {
      return _then(_value.copyWith(compactProduct: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductOnLoadedCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory _$$ProductOnLoadedCopyWith(
          _$ProductOnLoaded value, $Res Function(_$ProductOnLoaded) then) =
      __$$ProductOnLoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CompactProduct compactProduct});

  @override
  $CompactProductCopyWith<$Res> get compactProduct;
}

/// @nodoc
class __$$ProductOnLoadedCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$ProductOnLoaded>
    implements _$$ProductOnLoadedCopyWith<$Res> {
  __$$ProductOnLoadedCopyWithImpl(
      _$ProductOnLoaded _value, $Res Function(_$ProductOnLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compactProduct = null,
  }) {
    return _then(_$ProductOnLoaded(
      null == compactProduct
          ? _value.compactProduct
          : compactProduct // ignore: cast_nullable_to_non_nullable
              as CompactProduct,
    ));
  }
}

/// @nodoc

class _$ProductOnLoaded implements ProductOnLoaded {
  const _$ProductOnLoaded(this.compactProduct);

  @override
  final CompactProduct compactProduct;

  @override
  String toString() {
    return 'ProductEvent.onLoaded(compactProduct: $compactProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductOnLoaded &&
            (identical(other.compactProduct, compactProduct) ||
                other.compactProduct == compactProduct));
  }

  @override
  int get hashCode => Object.hash(runtimeType, compactProduct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductOnLoadedCopyWith<_$ProductOnLoaded> get copyWith =>
      __$$ProductOnLoadedCopyWithImpl<_$ProductOnLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CompactProduct compactProduct) onLoaded,
  }) {
    return onLoaded(compactProduct);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CompactProduct compactProduct)? onLoaded,
  }) {
    return onLoaded?.call(compactProduct);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CompactProduct compactProduct)? onLoaded,
    required TResult orElse(),
  }) {
    if (onLoaded != null) {
      return onLoaded(compactProduct);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductOnLoaded value) onLoaded,
  }) {
    return onLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductOnLoaded value)? onLoaded,
  }) {
    return onLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductOnLoaded value)? onLoaded,
    required TResult orElse(),
  }) {
    if (onLoaded != null) {
      return onLoaded(this);
    }
    return orElse();
  }
}

abstract class ProductOnLoaded implements ProductEvent {
  const factory ProductOnLoaded(final CompactProduct compactProduct) =
      _$ProductOnLoaded;

  @override
  CompactProduct get compactProduct;
  @override
  @JsonKey(ignore: true)
  _$$ProductOnLoadedCopyWith<_$ProductOnLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
