import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _loginButtonEnabled = true;

  Future _login(BuildContext context) async {
    //TODO: Сделать сохранение данных

    String? errorMessage;

    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final formState = _formKey.currentState;
    if (formState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (_) {
        errorMessage =
            'Such a user does not exist or the username or password is entered incorrectly';
      }
    } else {
      errorMessage = 'Enter a valid data';
    }

    if (errorMessage != null) {
      scaffoldMessenger.hideCurrentSnackBar();
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));

      setState(() {
        _loginButtonEnabled = true;
      });
    }
  }

  void _navigateToResetPassword(BuildContext context) {
    //TODO: Добавить сброс пароля
  }

  void _navigateToSignUpPage(BuildContext context) {
    context.router.navigateNamed('/signup');
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
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
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              context.router.replaceAll([HomeRoute()]);
            }

            return Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTitle(context),
                  const Expanded(child: SizedBox()),
                  Column(children: [
                    _buildFields(context),
                    const SizedBox(height: 10),
                    ..._buildLogIn(context),
                  ]),
                ],
              ),
            );
          },
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
          controller: _emailController,
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.email,
          autofocus: true,
          validator: (value) => ui_utils.isEmailValid(value ?? ''),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _passwordController,
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
                      ..onTap = () => _navigateToResetPassword(context),
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
          child: TextButton(
              onPressed: _loginButtonEnabled
                  ? () {
                      setState(() {
                        _loginButtonEnabled = false;
                      });

                      _login(context);
                    }
                  : null,
              child: const Text("Login")),
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
