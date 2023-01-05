import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/const.dart';
import 'package:marketplace/presentation/bloc/desired/desired_event.dart';
import 'package:marketplace/presentation/bloc/desired/desired_state.dart';

class DesiredBloc extends Bloc<DesiredEvent, DesiredState> {
  DesiredBloc() : super(const DesiredState.load()) {
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
