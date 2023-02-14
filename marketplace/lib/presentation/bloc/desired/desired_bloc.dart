import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/product_repository.dart';
import 'package:marketplace/presentation/bloc/desired/desired_event.dart';
import 'package:marketplace/presentation/bloc/desired/desired_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class DesiredBloc extends Bloc<DesiredEvent, DesiredState> {
  DesiredBloc() : super(const DesiredState.load()) {
    final productRepository = Get.find<ProductRepository>();

    on<DesiredOnLoaded>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const DesiredState.noNetwork());
        return;
      }

      emit(const DesiredState.load());

      var result = await productRepository.getDesired();
      await Future.delayed(const Duration(milliseconds: 1000));

      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
        );

        emit(DesiredState.error(message: message));
      }, (data) => emit(DesiredState.loading(desireds: data)));
    });
  }
}
