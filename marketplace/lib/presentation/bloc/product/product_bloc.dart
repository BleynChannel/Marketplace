import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/product.dart';
import 'package:marketplace/presentation/bloc/product/product_event.dart';
import 'package:marketplace/presentation/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  static bool debugIsNoNetwork = false;
  static bool debugIsError = false;

  Future<Product> debugGetProduct(CompactProduct compactProduct) async {
    return Future.value(compactProduct.toProduct());
  }

  ProductBloc() : super(const ProductState.load()) {
    on<ProductOnLoaded>((event, emit) async {
      //? Есть ли подключение к интернету?
      if (!debugIsNoNetwork) {
        emit(const ProductState.load());
      } else {
        emit(const ProductState.noNetwork());
      }

      //TODO: Получать данные с репозитория
      var product = await debugGetProduct(event.compactProduct);
      await Future.delayed(const Duration(milliseconds: 3000));

      if (!debugIsError) {
        emit(ProductState.loading(product: product));
      } else {
        emit(const ProductState.error());
      }
    });
  }
}
