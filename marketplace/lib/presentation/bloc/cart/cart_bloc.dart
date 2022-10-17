import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/presentation/bloc/cart/cart_state.dart';
import 'package:marketplace/presentation/bloc/cart/cart_event.dart';
import 'package:marketplace/presentation/debug_data.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  static bool debugIsNoNetwork = false;
  static bool debugIsError = false;

  CartBloc() : super(const CartState.load()) {
    on<CartOnLoaded>((event, emit) async {
      //? Есть ли подключение к интернету?
      if (!debugIsNoNetwork) {
        emit(const CartState.load());
      } else {
        emit(const CartState.noNetwork());
      }

      //TODO: Получать данные с репозитория
      var products = debugCartProductList;
      await Future.delayed(const Duration(milliseconds: 2000));

      if (!debugIsError) {
        emit(CartState.loading(products: products));
      } else {
        emit(const CartState.error());
      }
    });
  }
}
