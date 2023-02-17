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
          unknown: () => message = 'unknownError'.tr,
          networkRequestFailed: () => message = 'noInternet'.tr,
          invalidEmail: () => message = 'invalidEmail'.tr,
          missingAndroidPkgName: () =>
              message = 'missingAndroidPkgName'.tr,
          missingContinueUri: () =>
              message = 'missingContinueUri'.tr,
          missingIosBundleId: () =>
              message = 'missingIosBundleId'.tr,
          invalidContinueUri: () => message =
              'invalidContinueUri'.tr,
          unauthorizedContinueUri: () => message =
              'unauthorizedContinueUri'
                  .tr,
          userNotFound: () => message = 'userNotFound'.tr,
        );

        emit(ResetPasswordState.error(message: message));
      }, (date) => emit(const ResetPasswordState.success()));
    });
  }
}
