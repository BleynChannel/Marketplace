import 'package:marketplace/domain/entity/product.dart';

class CartProduct {
  final Product product;
  final int count;

  const CartProduct({
    required this.product,
    required this.count,
  });
}
