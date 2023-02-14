import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/auth_repository.dart';
import 'package:marketplace/presentation/bloc/login/login_event.dart';
import 'package:marketplace/presentation/bloc/login/login_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.empty()) {
    final authRepository = Get.find<AuthRepository>();

    on<LoginOnGoogleLogin>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const LoginState.noNetwork());
        return;
      }

      final result = await authRepository.loginGoogle();
      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
          networkRequestFailed: () => message = 'No network',
          accountExistsWithDifferentCredential: () => message =
              'The account is registered through another registration method',
          invalidCredential: () =>
              message = 'The credential is malformed or has expired',
          operationNotAllowed: () => message = 'The credential is not enabled',
          userDisabled: () => message = 'User is disabled',
          userNotFound: () => message = 'User not found',
          wrongPassword: () => message = 'Password is invalid',
          invalidVerificationCode: () =>
              message = 'The verification code of the credential is not valid',
          invalidVerificationId: () =>
              message = 'The verification ID of the credential is not valid.id',
        );

        emit(LoginState.error(message: message));
      }, (date) => emit(const LoginState.success()));
    });

    on<LoginOnGitHubLogin>((event, emit) async {
      if (debugIsNetwork) {
        emit(const LoginState.noNetwork());
        return;
      }

      final result = await authRepository.loginGitHub();
      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
          networkRequestFailed: () => message = 'No network',
          userDisabled: () => message = 'User is disabled',
        );

        emit(LoginState.error(message: message));
      }, (date) => emit(const LoginState.success()));
    });
  }
}
