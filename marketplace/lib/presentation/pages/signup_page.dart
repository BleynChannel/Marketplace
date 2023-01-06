import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:marketplace/domain/entity/signup.dart';
import 'package:marketplace/presentation/bloc/signup/signup_bloc.dart';
import 'package:marketplace/presentation/bloc/signup/signup_event.dart';
import 'package:marketplace/presentation/bloc/signup/signup_state.dart';
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
  late SignUpBloc bloc;

  final _formKey = GlobalKey<CustomFormState>();

  late TextEditingController _nicknameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late String _password;

  bool _signupButtonEnabled = true;

  void _signup(BuildContext context) {
    //TODO: Сделать сохранение данных

    final formState = _formKey.currentState;
    if (formState!.validate()) {
      final signUp = SignUp(
        nickname: _nicknameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      bloc.add(SignUpEvent.onSignUp(signUp));
    } else {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.hideCurrentSnackBar();
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Enter a valid data'),
      ));

      setState(() => _signupButtonEnabled = true);
    }
  }

  void _navigateToLogInPage(BuildContext context) {
    context.router.navigateNamed('/login');
  }

  @override
  void initState() {
    bloc = SignUpBloc();

    _nicknameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _password = '';

    super.initState();
  }

  @override
  void dispose() {
    _nicknameController.dispose();
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
        child: BlocListener<SignUpBloc, SignUpState>(
          bloc: bloc,
          listener: (context, state) => state.when<void>(
            empty: () {},
            success: () => context.router.replaceAll([HomeRoute()]),
            error: (message) {
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              scaffoldMessenger.hideCurrentSnackBar();
              scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));

              setState(() => _signupButtonEnabled = true);
            },
            noNetwork: () {
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              scaffoldMessenger.hideCurrentSnackBar();
              scaffoldMessenger.showSnackBar(const SnackBar(
                content: Text('No internet connection'),
              ));

              setState(() => _signupButtonEnabled = true);
            },
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
            child: Column(
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
          "Create new account",
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
    const passwordTooltipText =
        'The password must contain lowercase letters, uppercase letters, .!#\$%&№\'*+-/=?^_`(){|}~ characters and have a length of at least 8';

    return CustomForm(
      key: _formKey,
      child: Column(children: [
        CustomTextFormField(
          controller: _nicknameController,
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.none,
          hintText: "Nickname",
          prefixIcon: const Icon(Icons.person),
          autofocus: true,
          validator: (value) => ui_utils.isNicknameValid(value ?? ''),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _emailController,
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.email,
          validator: (value) => ui_utils.isEmailValid(value ?? ''),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _passwordController,
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.password,
          questionText: passwordTooltipText,
          maxLength: 15,
          validator: (value) => ui_utils.isPasswordValid(value ?? ''),
          onChanged: (value) => _password = value,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          fieldHeight: MediaQuery.of(context).size.height / 16,
          type: CustomTextFormFieldType.password,
          hintText: "Repeat password",
          questionText: passwordTooltipText,
          maxLength: 15,
          validator: (value) =>
              value == _password ? null : "Repeat the password correctly",
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
            onPressed: _signupButtonEnabled
                ? () {
                    setState(() {
                      _signupButtonEnabled = false;
                    });

                    _signup(context);
                  }
                : null,
            child: const Text("Sign Up"),
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
