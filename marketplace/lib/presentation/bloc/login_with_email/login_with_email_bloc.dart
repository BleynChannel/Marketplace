import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/auth_repository.dart';
import 'package:marketplace/presentation/bloc/login_with_email/login_with_email_event.dart';
import 'package:marketplace/presentation/bloc/login_with_email/login_with_email_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class LoginWithEmailBloc
    extends Bloc<LoginWithEmailEvent, LoginWithEmailState> {
  LoginWithEmailBloc() : super(const LoginWithEmailState.empty()) {
    final authRepository = Get.find<AuthRepository>();

    on<LoginWithEmailOnLogin>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const LoginWithEmailState.noNetwork());
        return;
      }

      final result = await authRepository.loginWithEmail(event.login);
      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
          networkRequestFailed: () => message = 'No network',
          invalidEmail: () => message = 'Email address is not valid',
          userDisabled: () => message = 'User is disabled',
          userNotFound: () => message = 'User not found',
          wrongPassword: () => message = 'Password is invalid',
        );

        emit(LoginWithEmailState.error(message: message));
      }, (date) => emit(const LoginWithEmailState.success()));
    });
  }
}
