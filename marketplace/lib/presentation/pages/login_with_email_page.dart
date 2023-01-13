import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:marketplace/domain/entity/login.dart';
import 'package:marketplace/presentation/bloc/login_with_email/login_with_email_bloc.dart';
import 'package:marketplace/presentation/bloc/login_with_email/login_with_email_event.dart';
import 'package:marketplace/presentation/bloc/login_with_email/login_with_email_state.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/custom_form.dart';
import 'package:marketplace/presentation/widgets/custom_text_form_field.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';

class LoginWithEmailPage extends StatefulWidget {
  final String? email;

  const LoginWithEmailPage({Key? key, this.email}) : super(key: key);

  @override
  State<LoginWithEmailPage> createState() => _LoginWithEmailPageState();
}

class _LoginWithEmailPageState extends State<LoginWithEmailPage> {
  late LoginWithEmailBloc bloc;

  final _formKey = GlobalKey<CustomFormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _loginButtonEnabled = true;

  void _login(BuildContext context) {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      final login = Login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      bloc.add(LoginWithEmailEvent.onLogin(login));
    } else {
      ui_utils.sendScaffoldMessage(context, message: 'Enter a valid data');
      setState(() => _loginButtonEnabled = true);
    }
  }

  void _navigateToResetPassword(BuildContext context) {
    context.router
        .navigate(ResetPasswordRoute(email: _emailController.text.trim()));
  }

  void _navigateToSignUpPage(BuildContext context) {
    context.router.navigate(SignUpRoute(email: _emailController.text.trim()));
  }

  void _navigateToHomePage(BuildContext context) {
    context.router.replaceAll([HomeRoute()]);
  }

  @override
  void initState() {
    bloc = LoginWithEmailBloc();

    _emailController = TextEditingController(text: widget.email);
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    bloc.close();

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
        child: BlocListener<LoginWithEmailBloc, LoginWithEmailState>(
          bloc: bloc,
          listener: (context, state) => state.when<void>(
            empty: () {},
            success: () => _navigateToHomePage(context),
            error: (message) {
              ui_utils.sendScaffoldMessage(context, message: message);
              setState(() => _loginButtonEnabled = true);
            },
            noNetwork: () {
              ui_utils.sendScaffoldMessage(context,
                  message: 'No internet connection');
              setState(() => _loginButtonEnabled = true);
            },
          ),
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
