import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/const.dart';
import 'package:marketplace/presentation/bloc/discover/discover_event.dart';
import 'package:marketplace/presentation/bloc/discover/discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc() : super(const DiscoverState.load()) {
    on<DiscoverOnLoaded>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const DiscoverState.noNetwork());
        return;
      }

      emit(const DiscoverState.load());

      var result = await productRepository.discoverGetProducts(
          platforms: event.platforms);
      await Future.delayed(const Duration(milliseconds: 1000));

      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
        );

        emit(DiscoverState.error(message: message));
      }, (data) => emit(DiscoverState.loading(products: data)));
    });
  }
}
