import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:marketplace/presentation/bloc/reset_password/reset_password_event.dart';
import 'package:marketplace/presentation/provider/auth_provider.dart';
import 'package:marketplace/core/utils/utils.dart';

class ResetPasswordController extends GetxController {
  final authProvider = Get.find<AuthProvider>();

  late TextEditingController emailController;

  final bloc = ResetPasswordBloc();

  final _resetButtonEnabled = true.obs;
  set resetButtonEnabled(bool value) => _resetButtonEnabled.value = value;
  bool get resetButtonEnabled => _resetButtonEnabled.value;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController()
      ..addListener(() => authProvider.email = emailController.text.trim());
  }

  @override
  void onClose() {
    emailController.dispose();

    super.onClose();
  }

  void resetPassword(BuildContext context) {
    resetButtonEnabled = false;

    if (Utils.isEmailValid(emailController.text.trim()) == null) {
      bloc.add(ResetPasswordEvent.onResetPassword(
        email: emailController.text.trim(),
      ));
    } else {
      Utils.sendScaffoldMessage(context, message: 'Enter a valid data');
      resetButtonEnabled = true;
    }
  }

  void showDialogSucces(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text('Password reset link send! Check your email'),
      ),
    );
  }
}
