import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/const.dart';
import 'package:marketplace/presentation/bloc/login/login_event.dart';
import 'package:marketplace/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.empty()) {
    on<LoginOnGoogleLogin>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const LoginState.noNetwork());
        return;
      }

      final result = await userRepository.loginGoogle();
      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
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

      final result = await userRepository.loginGitHub();
      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
          userDisabled: () => message = 'User is disabled',
        );

        emit(LoginState.error(message: message));
      }, (date) => emit(const LoginState.success()));
    });
  }
}