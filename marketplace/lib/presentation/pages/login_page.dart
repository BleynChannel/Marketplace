import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:marketplace/presentation/pages/login_with_email_page.dart';
import 'package:marketplace/presentation/pages/signup_page.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/login_to_button.dart';

import '../widgets/gradient_devider.dart';

class _ContinueWith {
  final Widget icon;
  final String label;
  final VoidCallback onPressed;

  _ContinueWith(this.icon, this.label, this.onPressed);
}

class LoginPage extends StatelessWidget {
  final _continueWithMap = [
    _ContinueWith(
      SvgPicture.asset("assets/icons/google.svg"),
      'Google',
      () {},
    ),
    _ContinueWith(
      SvgPicture.asset("assets/icons/facebook.svg"),
      'Facebook',
      () {},
    ),
    _ContinueWith(
      SvgPicture.asset("assets/icons/vk.svg"),
      'VK',
      () {},
    ),
  ];

  LoginPage({Key? key}) : super(key: key);

  void _navigateToLogWithEmailPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogWithEmailPage(),
      ),
    );
  }

  void _navigateToSignUpPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
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
                ..._buildContinueWithButtons(context, _continueWithMap),
                const SizedBox(height: 10),
                Text(
                  "or",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 10),
                ..._buildLogInWithEmail(context),
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
        "assets/lottie/login_page.json",
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height / 3.4,
      ),
      Text(
        "Wellcome back!",
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    ];
  }

  List<Widget> _buildContinueWithButtons(
      BuildContext context, List<_ContinueWith> continueWithMap) {
    //Create a list of buttons with separators
    return continueWithMap
        .map((e) => LoginToButton(
              icon: e.icon,
              label: e.label,
              onPressed: e.onPressed,
            ))
        .toList()
        .expand((element) => [element, const SizedBox(height: 6)])
        .toList();
  }

  List<Widget> _buildLogInWithEmail(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: const Text("Log with Email"),
            onPressed: () => _navigateToLogWithEmailPage(context),
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
