import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/auth_repository.dart';
import 'package:marketplace/presentation/bloc/reset_password/reset_password_event.dart';
import 'package:marketplace/presentation/bloc/reset_password/reset_password_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(const ResetPasswordState.empty()) {
    final authRepository = Get.find<AuthRepository>();

    on<ResetPasswordOnResetPassword>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const ResetPasswordState.noNetwork());
        return;
      }

      final result = await authRepository.resetPassword(event.email);
      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
          networkRequestFailed: () => message = 'No network',
          invalidEmail: () => message = 'Email address is not valid',
          missingAndroidPkgName: () =>
              message = 'An Android package name must be provided',
          missingContinueUri: () =>
              message = 'A continue URL must be provided in the request',
          missingIosBundleId: () =>
              message = 'An iOS Bundle ID must be provided',
          invalidContinueUri: () =>
              message = 'The continue URL provided in the request is invalid',
          unauthorizedContinueUri: () => message =
              'The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console',
          userNotFound: () => message = 'User not found',
        );

        emit(ResetPasswordState.error(message: message));
      }, (date) => emit(const ResetPasswordState.success()));
    });
  }
}
