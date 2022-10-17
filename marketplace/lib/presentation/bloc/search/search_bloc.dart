import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/filter.dart';
import 'package:marketplace/presentation/bloc/search/search_event.dart';
import 'package:marketplace/presentation/bloc/search/search_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  static bool debugIsNoNetwork = false;
  static bool debugIsError = false;

  Future<List<CompactProduct>> debugGetProduct(Filter filter) async {
    // _filterList = debugProductList
    //     .where((product) => ui_utils.isCorrectFilter(product, _filter))
    //     .map((product) => product.toCompactProduct())
    //     .toList();

    return Future.value(debugCompactProductList);
  }

  SearchBloc() : super(const SearchState.load()) {
    on<SearchOnLoaded>((event, emit) async {
      //? Есть ли подключение к интернету?
      if (!debugIsNoNetwork) {
        emit(const SearchState.load());
      } else {
        emit(const SearchState.noNetwork());
      }

      //TODO: Получать данные с репозитория
      var products = await debugGetProduct(event.filter);
      await Future.delayed(const Duration(milliseconds: 1000));

      if (!debugIsError) {
        emit(SearchState.loading(filterProducts: products));
      } else {
        emit(const SearchState.error());
      }
    });
  }
}
