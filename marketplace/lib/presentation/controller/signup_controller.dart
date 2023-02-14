import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/entity/signup.dart';
import 'package:marketplace/presentation/bloc/signup/signup_bloc.dart';
import 'package:marketplace/presentation/bloc/signup/signup_event.dart';
import 'package:marketplace/presentation/provider/auth_provider.dart';
import 'package:marketplace/presentation/widgets/custom_form.dart';
import 'package:marketplace/core/utils/utils.dart' as ui_utils;

class SignUpController extends GetxController {
  final authProvider = Get.find<AuthProvider>();

  late TextEditingController nicknameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final bloc = SignUpBloc();

  final formKey = GlobalKey<CustomFormState>();

  String password = '';

  final _signupButtonEnabled = true.obs;
  set signupButtonEnabled(bool value) => _signupButtonEnabled.value = value;
  bool get signupButtonEnabled => _signupButtonEnabled.value;

  @override
  void onInit() {
    super.onInit();

    nicknameController = TextEditingController();
    emailController = TextEditingController()
      ..addListener(() => authProvider.email = emailController.text.trim());
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    nicknameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  void signup(BuildContext context) {
    signupButtonEnabled = false;

    final formState = formKey.currentState;
    if (formState!.validate()) {
      final signUp = SignUp(
        nickname: nicknameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      bloc.add(SignUpEvent.onSignUp(signUp));
    } else {
      ui_utils.sendScaffoldMessage(context, message: 'Enter a valid data');
      signupButtonEnabled = true;
    }
  }

  void navigateToLogInPage(BuildContext context) {
    context.router.navigateNamed('/auth/login');
  }
}
