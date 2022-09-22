import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/compact_product.dart';

part 'cart_product.freezed.dart';

@freezed
class CartProduct with _$CartProduct {
  const factory CartProduct({
    required CompactProduct product,
    required int count,
  }) = _CartProduct;
}
