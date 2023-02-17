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
          unknown: () => message = 'unknownError'.tr,
          networkRequestFailed: () => message = 'noInternet'.tr,
          accountExistsWithDifferentCredential: () =>
              message = 'accountExistsWithDifferentCredential'.tr,
          invalidCredential: () =>
              message = 'invalidCredential'.tr,
          operationNotAllowed: () =>
              message = 'operationNotAllowed'.tr,
          userDisabled: () => message = 'User is disabled'.tr,
          userNotFound: () => message = 'userNotFound'.tr,
          wrongPassword: () => message = 'wrongPassword'.tr,
          invalidVerificationCode: () => message =
              'invalidVerificationCode'.tr,
          invalidVerificationId: () => message =
              'invalidVerificationId'.tr,
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
          unknown: () => message = 'unknownError'.tr,
          networkRequestFailed: () => message = 'noInternet'.tr,
          userDisabled: () => message = 'userDisabled'.tr,
        );

        emit(LoginState.error(message: message));
      }, (date) => emit(const LoginState.success()));
    });
  }
}
