import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/product_repository.dart';
import 'package:marketplace/presentation/bloc/product/product_event.dart';
import 'package:marketplace/presentation/bloc/product/product_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState.load()) {
    final productRepository = Get.find<ProductRepository>();

    on<ProductOnLoaded>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const ProductState.noNetwork());
        return;
      }

      emit(const ProductState.load());

      var result = await productRepository.getProduct(id: event.id);

      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'unknownError'.tr,
          notFound: () => message = 'productNotFound'.tr,
        );

        emit(ProductState.error(message: message));
      }, (data) => emit(ProductState.loading(product: data)));
    });
  }
}
