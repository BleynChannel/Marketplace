import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/custom_form.dart';
import 'package:marketplace/presentation/widgets/custom_text_form_field.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<CustomFormState>();

  late bool _saveData;
  late String _password;

  void _navigateToHomePage(BuildContext context) {
    //TODO: Сделать сохранение данных

    String? errorTooltipMessage = 'Error';
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final formState = _formKey.currentState;
    if (formState!.validate()) {
      //TODO: Проверять данные с сервера
      if (errorTooltipMessage != null) {
        scaffoldMessenger.hideCurrentSnackBar();
        scaffoldMessenger.showSnackBar(SnackBar(
          content: Text(errorTooltipMessage),
        ));
      } else {
        context.router.replaceAll([HomeRoute()]);
      }
    } else {
      scaffoldMessenger.hideCurrentSnackBar();
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Enter a valid data'),
      ));
    }
  }

  void _navigateToLogInPage(BuildContext context) {
    context.router.navigateNamed('/login');
  }

  @override
  void initState() {
    _saveData = false;
    _password = '';

    super.initState();
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
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(context),
              const Expanded(child: SizedBox()),
              Column(children: [
                _buildFields(context),
                ..._buildLogIn(context),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Expanded(
      flex: 4,
      child: LayoutBuilder(builder: (context, constrained) {
        final title = Text(
          "Create new account",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        );

        final imageHeight = MediaQuery.of(context).size.height / 4.2;

        if (constrained.maxHeight < imageHeight + 100) {
          return title;
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                "assets/lottie/register_page.json",
                fit: BoxFit.cover,
                height: imageHeight,
              ),
              title,
            ],
          );
        }
      }),
    );
  }

  Widget _buildFields(BuildContext context) {
    const passwordTooltipText =
        'The password must contain lowercase letters, uppercase letters, .!#\$%&№\'*+-/=?^_`(){|}~ characters and have a length of at least 8';

    return CustomForm(
      key: _formKey,
      child: Column(children: [
        CustomTextFormField(
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.email,
          autofocus: true,
          validator: (value) => ui_utils.isEmailValid(value ?? ''),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.password,
          helpText: passwordTooltipText,
          maxLength: 15,
          validator: (value) => ui_utils.isPasswordValid(value ?? ''),
          onChanged: (value) => _password = value,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.password,
          hintText: "Repeat password",
          helpText: passwordTooltipText,
          maxLength: 15,
          validator: (value) =>
              value == _password ? null : "Repeat the password correctly",
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Remember me"),
            const SizedBox(width: 4),
            Checkbox(
              value: _saveData,
              onChanged: (value) => setState(() => _saveData = value!),
            ),
          ],
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
          child: TextButton(
            child: const Text("Sign Up"),
            onPressed: () => _navigateToHomePage(context),
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
              text: "Already have an account? ",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: Colors.white70),
              children: [
                TextSpan(
                  text: "Log In",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.bold),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _navigateToLogInPage(context),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }
}
