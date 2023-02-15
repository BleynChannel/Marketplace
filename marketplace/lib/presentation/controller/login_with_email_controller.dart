import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/entity/login.dart';
import 'package:marketplace/presentation/bloc/login_with_email/login_with_email_bloc.dart';
import 'package:marketplace/presentation/bloc/login_with_email/login_with_email_event.dart';
import 'package:marketplace/presentation/provider/auth_provider.dart';
import 'package:marketplace/presentation/widgets/custom_form.dart';
import 'package:marketplace/core/utils/utils.dart';

class LoginWithEmailController extends GetxController {
  final authProvider = Get.find<AuthProvider>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  final bloc = LoginWithEmailBloc();

  final formKey = GlobalKey<CustomFormState>();

  final _loginButtonEnabled = true.obs;
  set loginButtonEnabled(bool value) => _loginButtonEnabled.value = value;
  bool get loginButtonEnabled => _loginButtonEnabled.value;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController()
      ..addListener(() => authProvider.email = emailController.text.trim());
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  void login(BuildContext context) {
    loginButtonEnabled = false;

    final formState = formKey.currentState;
    if (formState!.validate()) {
      final login = Login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      bloc.add(LoginWithEmailEvent.onLogin(login));
    } else {
      Utils.sendScaffoldMessage(context, message: 'Enter a valid data');
      loginButtonEnabled = true;
    }
  }

  void navigateToResetPassword(BuildContext context) {
    context.router.navigateNamed('/auth/reset_password');
  }

  void navigateToSignUpPage(BuildContext context) {
    context.router.navigateNamed('/auth/signup');
  }
}
