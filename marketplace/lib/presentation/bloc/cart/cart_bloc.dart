import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/product_repository.dart';
import 'package:marketplace/presentation/bloc/cart/cart_state.dart';
import 'package:marketplace/presentation/bloc/cart/cart_event.dart';
import 'package:marketplace/presentation/debug_data.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState.load()) {
    final productRepository = Get.find<ProductRepository>();
    
    on<CartOnLoaded>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const CartState.noNetwork());
        return;
      }

      emit(const CartState.load());

      var result = await productRepository.getCartProducts();
      await Future.delayed(const Duration(milliseconds: 2000));

      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'unknownError'.tr,
        );

        emit(CartState.error(message: message));
      }, (data) => emit(CartState.loading(products: data)));
    });
  }
}
