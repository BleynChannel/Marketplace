import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:marketplace/presentation/bloc/login/login_bloc.dart';
import 'package:marketplace/presentation/bloc/login/login_event.dart';
import 'package:marketplace/presentation/bloc/login/login_state.dart';
import 'package:marketplace/core/const/colors.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/core/utils/utils.dart' as ui_utils;

import '../widgets/gradient_devider.dart';

class _ContinueWith {
  final Widget icon;
  final String label;
  final LoginEvent Function(BuildContext context) sendEvent;

  _ContinueWith(this.icon, this.label, this.sendEvent);
}

class LoginPage extends StatelessWidget {
  final bloc = LoginBloc();

  final _continueWithMap = [
    _ContinueWith(
      SvgPicture.asset("assets/icons/social/google.svg"),
      'Google',
      (BuildContext context) => const LoginEvent.onGoogleLogin(),
    ),
    _ContinueWith(
      SvgPicture.asset(
        "assets/icons/social/github.svg",
        color: Colors.white,
      ),
      'GitHub',
      (BuildContext context) => const LoginEvent.onGitHubLogin(),
    ),
  ];

  LoginPage({Key? key}) : super(key: key);

  void _navigateToLogWithEmailPage(BuildContext context) {
    context.router.navigateNamed('/auth/email');
  }

  void _navigateToSignUpPage(BuildContext context) {
    context.router.navigateNamed('/auth/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BackgroundBlur(
        child: BlocListener<LoginBloc, LoginState>(
          bloc: bloc,
          listener: (context, state) => state.when<void>(
            empty: () {},
            success: () {},
            error: (message) =>
                ui_utils.sendScaffoldMessage(context, message: message),
            noNetwork: () => ui_utils.sendScaffoldMessage(context,
                message: 'No internet connection'),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
            child: Center(
              child: Column(children: [
                Expanded(
                  flex: 5,
                  child: _buildTitle(context),
                ),
                const Expanded(child: SizedBox()),
                ..._buildContinueWithButtons(context, _continueWithMap, bloc),
                const SizedBox(height: 10),
                Text(
                  "or",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                ..._buildLogInWithEmail(context),
              ]),
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
          "Welcome back!",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontWeight: FontWeight.bold),
          minFontSize: 16,
        );

        if (constrained.minHeight > 20 && constrained.minHeight <= 160) {
          return textWidget;
        } else if (constrained.minHeight > 160) {
          return Column(children: [
            Expanded(child: textWidget),
            Expanded(
              flex: 3,
              child: LottieBuilder.asset(
                "assets/lottie/login_page.json",
                fit: BoxFit.cover,
              ),
            )
          ]);
        }

        return const SizedBox();
      },
    );
  }

  Iterable<Widget> _buildContinueWithButtons(BuildContext context,
      List<_ContinueWith> continueWithMap, LoginBloc bloc) {
    //Create a list of buttons with separators
    return continueWithMap
        .map((e) => LoginToButton(
              icon: e.icon,
              label: e.label,
              onPressed: () => bloc.add(e.sendEvent(context)),
            ))
        .expand((element) => [element, const SizedBox(height: 6)]);
  }

  List<Widget> _buildLogInWithEmail(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: TextButton(
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

class LoginToButton extends StatelessWidget {
  final Widget icon;
  final String label;

  final VoidCallback onPressed;

  const LoginToButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        side: const BorderSide(color: AppColors.primaryColor),
      ),
      onPressed: onPressed,
      icon: icon,
      label: RichText(
        text: TextSpan(
          text: "Continue with ",
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
