import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/presentation/bloc/notification/notification_event.dart';
import 'package:marketplace/presentation/bloc/notification/notification_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  static bool debugIsNoNetwork = false;
  static bool debugIsError = false;

  NotificationBloc() : super(const NotificationState.load()) {
    on<NotificationOnLoaded>((event, emit) async {
      //? Есть ли подключение к интернету?
      if (!debugIsNoNetwork) {
        emit(const NotificationState.load());
      } else {
        emit(const NotificationState.noNetwork());
      }

      //TODO: Получать данные с репозитория
      var notifications = debugNotification;
      await Future.delayed(const Duration(milliseconds: 1000));

      if (!debugIsError) {
        emit(NotificationState.loading(notifications: notifications));
      } else {
        emit(const NotificationState.error());
      }
    });
  }
}
