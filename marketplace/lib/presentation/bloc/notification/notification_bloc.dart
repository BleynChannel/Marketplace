import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/user_repository.dart';
import 'package:marketplace/presentation/bloc/notification/notification_event.dart';
import 'package:marketplace/presentation/bloc/notification/notification_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState.load()) {
    final userRepository = Get.find<UserRepository>();
    
    on<NotificationOnLoaded>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const NotificationState.noNetwork());
        return;
      }

      emit(const NotificationState.load());

      var result = await userRepository.getNotifications();
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
