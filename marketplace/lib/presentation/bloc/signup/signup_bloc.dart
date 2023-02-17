import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/auth_repository.dart';
import 'package:marketplace/presentation/bloc/signup/signup_event.dart';
import 'package:marketplace/presentation/bloc/signup/signup_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState.empty()) {
    final authRepository = Get.find<AuthRepository>();

    on<SignUpOnSignUp>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const SignUpState.noNetwork());
        return;
      }

      final result = await authRepository.signUp(event.signUp);
      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'unknownError'.tr,
          networkRequestFailed: () => message = 'noInternet'.tr,
          emailAlreadyInUse: () =>
              message = 'emailAlreadyInUse'.tr,
          invalidEmail: () => message = 'invalidEmail'.tr,
          operationNotAllowed: () =>
              message = 'operationNotAllowed'.tr,
          weakPassword: () => message = 'weakPassword'.tr,
        );

        emit(SignUpState.error(message: message));
      }, (date) => emit(const SignUpState.success()));
    });
  }
}
