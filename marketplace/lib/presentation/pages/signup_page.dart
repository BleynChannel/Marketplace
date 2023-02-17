import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:marketplace/presentation/bloc/signup/signup_bloc.dart';
import 'package:marketplace/presentation/bloc/signup/signup_state.dart';
import 'package:marketplace/presentation/controller/signup_controller.dart';
import 'package:marketplace/presentation/provider/auth_provider.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/custom_form.dart';
import 'package:marketplace/presentation/widgets/custom_text_form_field.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';
import 'package:marketplace/core/utils/utils.dart';

class SignUpPage extends GetView<SignUpController> {
  SignUpPage({Key? key}) : super(key: key) {
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
        child: BlocListener<SignUpBloc, SignUpState>(
          bloc: controller.bloc,
          listener: (context, state) {
            state.when<void>(
              empty: () {},
              success: () {},
              error: (message) =>
                  Utils.sendScaffoldMessage(context, message: message),
              noNetwork: () => Utils.sendScaffoldMessage(context,
                  message: 'noInternet'),
            );

            controller.signupButtonEnabled = true;
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
            child: Column(children: [
              Expanded(
                flex: 5,
                child: _buildTitle(context),
              ),
              const Expanded(child: SizedBox()),
              Column(children: [
                _buildFields(context),
                const SizedBox(height: 10),
                ..._buildSignUp(context),
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrained) {
        final textWidget = AutoSizeText(
          'signupTitle'.tr,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          minFontSize: 20,
        );

        if (constrained.minHeight > 30 && constrained.minHeight <= 160) {
          return textWidget;
        } else if (constrained.minHeight > 160) {
          return Column(children: [
            Expanded(child: textWidget),
            Expanded(
              flex: 4,
              child: LottieBuilder.asset(
                "assets/lottie/register_page.json",
                fit: BoxFit.cover,
              ),
            )
          ]);
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildFields(BuildContext context) {
    final passwordTooltipText =
        'passwordTooltip'.tr;

    return CustomForm(
      key: controller.formKey,
      child: Column(children: [
        CustomTextFormField(
          controller: controller.nicknameController,
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.none,
          hintText: 'signupNickname'.tr,
          prefixIcon: const Icon(Icons.person),
          autofocus: true,
          validator: (value) => Utils.isNicknameValid(value ?? ''),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: controller.emailController,
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.email,
          validator: (value) => Utils.isEmailValid(value ?? ''),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: controller.passwordController,
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.password,
          questionText: passwordTooltipText,
          maxLength: 15,
          validator: (value) => Utils.isPasswordValid(value ?? ''),
          onChanged: (value) => controller.password = value,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.password,
          hintText: 'signupRepeatPassword'.tr,
          questionText: passwordTooltipText,
          maxLength: 15,
          validator: (value) => value == controller.password
              ? null
              : 'signupRepeatPasswordValidate'.tr,
        ),
      ]),
    );
  }

  List<Widget> _buildSignUp(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Obx(
            () => ElevatedButton(
              onPressed: controller.signupButtonEnabled
                  ? () => controller.signup(context)
                  : null,
              child: Text('signup'.tr),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      const GradientDevider(isHorizontal: true),
      const SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: double.infinity,
          child: RichText(
            text: TextSpan(
              text: "${'signupQuestionAccount'.tr} ",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: Colors.white70),
              children: [
                TextSpan(
                  text: 'login'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.bold),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => controller.navigateToLogInPage(context),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }
}
