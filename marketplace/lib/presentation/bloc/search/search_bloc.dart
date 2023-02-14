import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/product_repository.dart';
import 'package:marketplace/presentation/bloc/search/search_event.dart';
import 'package:marketplace/presentation/bloc/search/search_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState.load()) {
    final productRepository = Get.find<ProductRepository>();

    on<SearchOnLoaded>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const SearchState.noNetwork());
        return;
      }

      emit(const SearchState.load());

      var result = await productRepository.searchProducts(filter: event.filter);
      await Future.delayed(const Duration(milliseconds: 1000));

      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
        );

        emit(SearchState.error(message: message));
      }, (data) => emit(SearchState.loading(filterProducts: data)));
    });
  }
}
