import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/cart_product.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.load() = CartStateLoad;
  const factory CartState.loading({
    required List<CartProduct> products,
  }) = CartStateLoading;
  const factory CartState.error() = CartStateError;
  const factory CartState.noNetwork() = CartStateNoNetwork;
}
