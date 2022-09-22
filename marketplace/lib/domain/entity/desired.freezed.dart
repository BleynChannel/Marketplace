// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'desired.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Desired {
  CompactProduct get product => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DesiredCopyWith<Desired> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesiredCopyWith<$Res> {
  factory $DesiredCopyWith(Desired value, $Res Function(Desired) then) =
      _$DesiredCopyWithImpl<$Res>;
  $Res call({CompactProduct product});

  $CompactProductCopyWith<$Res> get product;
}

/// @nodoc
class _$DesiredCopyWithImpl<$Res> implements $DesiredCopyWith<$Res> {
  _$DesiredCopyWithImpl(this._value, this._then);

  final Desired _value;
  // ignore: unused_field
  final $Res Function(Desired) _then;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as CompactProduct,
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
abstract class _$$_DesiredCopyWith<$Res> implements $DesiredCopyWith<$Res> {
  factory _$$_DesiredCopyWith(
          _$_Desired value, $Res Function(_$_Desired) then) =
      __$$_DesiredCopyWithImpl<$Res>;
  @override
  $Res call({CompactProduct product});

  @override
  $CompactProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_DesiredCopyWithImpl<$Res> extends _$DesiredCopyWithImpl<$Res>
    implements _$$_DesiredCopyWith<$Res> {
  __$$_DesiredCopyWithImpl(_$_Desired _value, $Res Function(_$_Desired) _then)
      : super(_value, (v) => _then(v as _$_Desired));

  @override
  _$_Desired get _value => super._value as _$_Desired;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(_$_Desired(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as CompactProduct,
    ));
  }
}

/// @nodoc

class _$_Desired implements _Desired {
  const _$_Desired({required this.product});

  @override
  final CompactProduct product;

  @override
  String toString() {
    return 'Desired(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Desired &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$$_DesiredCopyWith<_$_Desired> get copyWith =>
      __$$_DesiredCopyWithImpl<_$_Desired>(this, _$identity);
}

abstract class _Desired implements Desired {
  const factory _Desired({required final CompactProduct product}) = _$_Desired;

  @override
  CompactProduct get product;
  @override
  @JsonKey(ignore: true)
  _$$_DesiredCopyWith<_$_Desired> get copyWith =>
      throw _privateConstructorUsedError;
}
