import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/presentation/bloc/discover/discover_event.dart';
import 'package:marketplace/presentation/bloc/discover/discover_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  static bool debugIsNoNetwork = false;
  static bool debugIsError = false;

  Future<Map<String, List<CompactProduct>>> _debugGetProduct() async {
    return Future.value({
      'Main': debugCompactProductList,
      'Most Popular': debugCompactProductList,
      'Free This Week': debugCompactProductList,
      'Special Offers': debugCompactProductList,
      'You will like': debugCompactProductList,
    });
  }

  DiscoverBloc() : super(const DiscoverState.load()) {
    on<DiscoverOnLoaded>((event, emit) async {
      //? Есть ли подключение к интернету?
      if (!debugIsNoNetwork) {
        emit(const DiscoverState.load());
      } else {
        emit(const DiscoverState.noNetwork());
      }

      //TODO: Получать данные с репозитория
      var products = await _debugGetProduct();
      await Future.delayed(const Duration(milliseconds: 1000));

      if (!debugIsError) {
        emit(DiscoverState.loading(products: products));
      } else {
        emit(const DiscoverState.error());
      }
    });
  }
}
