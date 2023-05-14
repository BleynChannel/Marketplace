// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$DesiredCopyWithImpl<$Res, Desired>;
  @useResult
  $Res call({CompactProduct product});

  $CompactProductCopyWith<$Res> get product;
}

/// @nodoc
class _$DesiredCopyWithImpl<$Res, $Val extends Desired>
    implements $DesiredCopyWith<$Res> {
  _$DesiredCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as CompactProduct,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompactProductCopyWith<$Res> get product {
    return $CompactProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DesiredCopyWith<$Res> implements $DesiredCopyWith<$Res> {
  factory _$$_DesiredCopyWith(
          _$_Desired value, $Res Function(_$_Desired) then) =
      __$$_DesiredCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CompactProduct product});

  @override
  $CompactProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_DesiredCopyWithImpl<$Res>
    extends _$DesiredCopyWithImpl<$Res, _$_Desired>
    implements _$$_DesiredCopyWith<$Res> {
  __$$_DesiredCopyWithImpl(_$_Desired _value, $Res Function(_$_Desired) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$_Desired(
      product: null == product
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
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
