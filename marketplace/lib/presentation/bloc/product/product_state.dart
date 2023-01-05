import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/product.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.load() = ProductStateLoad;
  const factory ProductState.loading({
    required Product product,
  }) = ProductStateLoading;
  const factory ProductState.error({required String message}) = ProductStateError;
  const factory ProductState.noNetwork() = ProductStateNoNetwork;
}
