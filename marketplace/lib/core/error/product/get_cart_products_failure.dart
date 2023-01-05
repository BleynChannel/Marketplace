import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_cart_products_failure.freezed.dart';

@freezed
class GetCartProductsFailure with _$GetCartProductsFailure {
  const factory GetCartProductsFailure.unknown() =
      GetCartProductsFailureUnknown;
}
