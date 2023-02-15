import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:marketplace/presentation/bloc/reset_password/reset_password_state.dart';
import 'package:marketplace/presentation/controller/reset_password_controller.dart';
import 'package:marketplace/presentation/provider/auth_provider.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/core/utils/utils.dart';
import 'package:marketplace/presentation/widgets/custom_text_form_field.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  ResetPasswordPage({Key? key}) : super(key: key) {
    controller.emailController.text = Get.find<AuthProvider>().email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BackgroundBlur(
        child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
          bloc: controller.bloc,
          listener: (context, state) {
            state.when<void>(
              empty: () {},
              success: () => controller.showDialogSucces(context),
              error: (message) =>
                  Utils.sendScaffoldMessage(context, message: message),
              noNetwork: () => Utils.sendScaffoldMessage(context,
                  message: 'No internet connection'),
            );

            controller.resetButtonEnabled = true;
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ..._buildTitle(context),
                  const SizedBox(height: 30),
                  _buildFields(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTitle(BuildContext context) {
    return [
      AutoSizeText(
        "Forgot password?",
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        minFontSize: 20,
      ),
      const SizedBox(height: 20),
      Text(
        "Enter You Email and we will send you a password reset link",
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Colors.white70),
        textAlign: TextAlign.center,
      ),
    ];
  }

  Widget _buildFields(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
        controller: controller.emailController,
        fieldHeight: MediaQuery.of(context).size.height / 16,
        type: CustomTextFormFieldType.email,
        validator: (value) => Utils.isEmailValid(value ?? ''),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Obx(
            () => ElevatedButton(
              onPressed: controller.resetButtonEnabled
                  ? () => controller.resetPassword(context)
                  : null,
              child: const Text("Reset password"),
            ),
          ),
        ),
      ),
    ]);
  }
}
