import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/const.dart';
import 'package:marketplace/presentation/bloc/notification/notification_event.dart';
import 'package:marketplace/presentation/bloc/notification/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState.load()) {
    on<NotificationOnLoaded>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const NotificationState.noNetwork());
        return;
      }

      emit(const NotificationState.load());

      var result = await productRepository.getNotifications();
      await Future.delayed(const Duration(milliseconds: 1000));

      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
        );

        emit(NotificationState.error(message: message));
      }, (data) => emit(NotificationState.loading(notifications: data)));
    });
  }
}
