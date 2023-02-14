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
          unknown: () => message = 'Unknown error',
          networkRequestFailed: () => message = 'No network',
          emailAlreadyInUse: () =>
              message = 'An account with this email already exists',
          invalidEmail: () => message = 'Email address is not valid',
          operationNotAllowed: () => message = 'The credential is not enabled',
          weakPassword: () => message = 'The password is not strong enough',
        );

        emit(SignUpState.error(message: message));
      }, (date) => emit(const SignUpState.success()));
    });
  }
}
