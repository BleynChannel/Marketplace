import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/custom_form.dart';
import 'package:marketplace/presentation/widgets/custom_text_form_field.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';

class LogWithEmailPage extends StatefulWidget {
  const LogWithEmailPage({Key? key}) : super(key: key);

  @override
  State<LogWithEmailPage> createState() => _LogWithEmailPageState();
}

class _LogWithEmailPageState extends State<LogWithEmailPage> {
  final _formKey = GlobalKey<CustomFormState>();

  late bool _saveData;

  void _navigateToHomePage(BuildContext context) {
    //TODO: Сделать сохранение данных

    String? errorTooltipMessage;
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

  void _navigateToSignUpPage(BuildContext context) {
    context.router.navigateNamed('/signup');
  }

  @override
  void initState() {
    _saveData = false;

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
          "Login with Email",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        );

        final imageHeight = MediaQuery.of(context).size.height / 3.7;

        if (constrained.maxHeight < imageHeight + 100) {
          return title;
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                "assets/lottie/login_email_page.json",
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
            child: const Text("Login"),
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
                    ..onTap = () => _navigateToSignUpPage(context),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }
}
