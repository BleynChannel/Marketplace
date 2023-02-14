import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:marketplace/presentation/bloc/login_with_email/login_with_email_bloc.dart';
import 'package:marketplace/presentation/bloc/login_with_email/login_with_email_state.dart';
import 'package:marketplace/presentation/controller/login_with_email_controller.dart';
import 'package:marketplace/presentation/provider/auth_provider.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/custom_form.dart';
import 'package:marketplace/presentation/widgets/custom_text_form_field.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';
import 'package:marketplace/core/utils/utils.dart' as ui_utils;

class LoginWithEmailPage extends GetView<LoginWithEmailController> {
  LoginWithEmailPage({Key? key}) : super(key: key) {
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
        child: BlocListener<LoginWithEmailBloc, LoginWithEmailState>(
          bloc: controller.bloc,
          listener: (context, state) {
            state.when<void>(
              empty: () {},
              success: () {},
              error: (message) =>
                  ui_utils.sendScaffoldMessage(context, message: message),
              noNetwork: () => ui_utils.sendScaffoldMessage(context,
                  message: 'No internet connection'),
            );

            controller.loginButtonEnabled = true;
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: _buildTitle(context),
                ),
                const Expanded(child: SizedBox()),
                Column(children: [
                  _buildFields(context),
                  const SizedBox(height: 10),
                  ..._buildLogIn(context),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrained) {
        final textWidget = AutoSizeText(
          "Login with Email",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          minFontSize: 16,
        );

        if (constrained.minHeight > 20 && constrained.minHeight <= 160) {
          return textWidget;
        } else if (constrained.minHeight > 160) {
          return Column(children: [
            Expanded(child: textWidget),
            Expanded(
              flex: 7,
              child: LottieBuilder.asset(
                "assets/lottie/login_email_page.json",
                fit: BoxFit.scaleDown,
              ),
            )
          ]);
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildFields(BuildContext context) {
    const passwordTooltipText =
        'The password must contain lowercase letters, uppercase letters, .!#\$%&№\'*+-/=?^_`(){|}~ characters and have a length of at least 8';

    return CustomForm(
      key: controller.formKey,
      child: Column(children: [
        CustomTextFormField(
          controller: controller.emailController,
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.email,
          autofocus: true,
          validator: (value) => ui_utils.isEmailValid(value ?? ''),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: controller.passwordController,
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.password,
          questionText: passwordTooltipText,
          maxLength: 15,
          helperText: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: RichText(
              text: TextSpan(
                text: "Forgot your password? ",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white70),
                children: [
                  TextSpan(
                    text: "Reset password",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(fontWeight: FontWeight.bold),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => controller.navigateToResetPassword(context),
                  ),
                ],
              ),
            ),
          ),
          validator: (value) => ui_utils.isPasswordValid(value ?? ''),
        ),
      ]),
    );
  }

  List<Widget> _buildLogIn(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Obx(
            () => TextButton(
              onPressed: controller.loginButtonEnabled
                  ? () => controller.login(context)
                  : null,
              child: const Text("Login"),
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
      const GradientDevider(isHorizontal: true),
      const SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: double.infinity,
          child: RichText(
            text: TextSpan(
              text: "Don’t have an account? ",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: Colors.white70),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.bold),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => controller.navigateToSignUpPage(context),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }
}
