import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/presentation/bloc/desired/desired_event.dart';
import 'package:marketplace/presentation/bloc/desired/desired_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class DesiredBloc extends Bloc<DesiredEvent, DesiredState> {
  static bool debugIsNoNetwork = false;
  static bool debugIsError = false;

  DesiredBloc() : super(const DesiredState.load()) {
    on<DesiredOnLoaded>((event, emit) async {
      //? Есть ли подключение к интернету?
      if (!debugIsNoNetwork) {
        emit(const DesiredState.load());
      } else {
        emit(const DesiredState.noNetwork());
      }

      //TODO: Получать данные с репозитория
      var desireds = debugDesiredList;
      await Future.delayed(const Duration(milliseconds: 1000));

      if (!debugIsError) {
        emit(DesiredState.loading(desireds: desireds));
      } else {
        emit(const DesiredState.error());
      }
    });
  }
}
