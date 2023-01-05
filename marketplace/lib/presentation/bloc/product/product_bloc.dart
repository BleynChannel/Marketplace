import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/const.dart';
import 'package:marketplace/presentation/bloc/product/product_event.dart';
import 'package:marketplace/presentation/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState.load()) {
    on<ProductOnLoaded>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const ProductState.noNetwork());
        return;
      }

      emit(const ProductState.load());

      var result = await productRepository.getProduct(event.compactProduct);
      await Future.delayed(const Duration(milliseconds: 3000));

      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
        );

        emit(ProductState.error(message: message));
      }, (data) => emit(ProductState.loading(product: data)));
    });
  }
}
