import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/cart_product.dart';
import 'package:marketplace/presentation/bloc/cart/cart_bloc.dart';
import 'package:marketplace/presentation/bloc/cart/cart_event.dart';

class CartController extends GetxController {
  static const int shimmerProductCount = 3;

  final bloc = CartBloc()..add(const CartEvent.onLoaded());

  final _checkedProduct = <CartProduct>[].obs;
  set checkedProduct(List<CartProduct> value) => _checkedProduct.value = value;
  RxList<CartProduct> get checkedProduct => _checkedProduct;

  final _cartProductList = <CartProduct>[].obs;
  set cartProductList(List<CartProduct> value) =>
      _cartProductList.value = value;
  RxList<CartProduct> get cartProductList => _cartProductList;

  final _allPrice = 0.0.obs;
  set allPrice(value) => _allPrice.value = value;
  get allPrice => _allPrice.value;

  final _allOldPrice = 0.0.obs;
  set allOldPrice(value) => _allOldPrice.value = value;
  get allOldPrice => _allOldPrice.value;

  void _changePrice() {
    allPrice = _checkedProduct.fold(
        0.0, (sum, cartProduct) => sum + cartProduct.product.price.price);
    allOldPrice = _checkedProduct.fold(
        0.0,
        (sum, cartProduct) =>
            sum +
            (cartProduct.product.price.oldPrice > 0
                ? cartProduct.product.price.oldPrice
                : cartProduct.product.price.price));
  }

  void onAllUnselected() {
    checkedProduct.clear();
    _changePrice();
  }

  void onAllSelected() {
    checkedProduct = [...cartProductList];
    _changePrice();
  }

  void onDeleteSelected() {
    //TODO: Вызвать событие удаления продукта
    cartProductList.removeWhere((product) => checkedProduct.contains(product));
    checkedProduct.clear();
    _changePrice();
  }

  void onRefreshPage() {
    bloc.add(const CartEvent.onLoaded());
  }

  void onProductCheck(CartProduct product, bool value) {
    if (value) {
      checkedProduct.add(product);
    } else {
      checkedProduct.remove(product);
    }

    _changePrice();
  }

  void onProductClick(BuildContext context, CartProduct cartProduct) {
    context.router.pushNamed('/product/${cartProduct.product.id}');
  }

  void onCheckout(BuildContext context) {
    //TODO: Переделать с использованием чистой архитектуры
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('cartCheckoutReadyTitle'.tr,
                style: GoogleFonts.roboto(fontSize: 18)),
            Text('cartCheckoutReadyDescription'.tr),
          ],
        ),
      ),
    );
  }
}
