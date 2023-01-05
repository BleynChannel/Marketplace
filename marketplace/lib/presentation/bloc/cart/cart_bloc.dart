import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/const.dart';
import 'package:marketplace/presentation/bloc/cart/cart_state.dart';
import 'package:marketplace/presentation/bloc/cart/cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState.load()) {
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
          unknown: () => message = 'Unknown error',
        );

        emit(CartState.error(message: message));
      }, (data) => emit(CartState.loading(products: data)));
    });
  }
}
