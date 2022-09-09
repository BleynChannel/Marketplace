import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';

class LogWithEmailPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LogWithEmailPage({Key? key}) : super(key: key);

  void _navigateToHomePage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  void _navigateToSignUpPage(BuildContext context) {
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BackgroundBlur(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
          child: Center(
            child: Column(
              children: [
                ..._buildTitle(context),
                const Expanded(child: SizedBox()),
                _buildFields(context, formKey),
                ..._buildLogIn(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTitle(BuildContext context) {
    return [
      LottieBuilder.asset(
        "assets/lottie/login_email_page.json",
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height / 3.7,
      ),
      Text(
        "Login with Email",
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ];
  }

  Widget _buildFields(BuildContext context, Key formKey) {
    return Form(
      key: formKey,
      child: Column(children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.continueAction,
          validator: (value) {
            // TODO: Написать валидатор
            return 'Help';
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () {},
            ),
          ),
          textInputAction: TextInputAction.continueAction,
          obscureText: true,
          validator: (value) {
            // TODO: Написать валидатор
            return 'Help';
          },
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Remember me"),
            const SizedBox(width: 4),
            Checkbox(value: false, onChanged: (value) {}),
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
                  .bodyText2
                  ?.copyWith(color: Colors.white.withOpacity(0.7)),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
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
