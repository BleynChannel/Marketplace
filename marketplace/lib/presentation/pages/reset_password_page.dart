import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:marketplace/presentation/bloc/reset_password/reset_password_event.dart';
import 'package:marketplace/presentation/bloc/reset_password/reset_password_state.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/custom_text_form_field.dart';

class ResetPasswordPage extends StatefulWidget {
  final String? email;

  const ResetPasswordPage({Key? key, this.email})
      : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late ResetPasswordBloc bloc;

  late TextEditingController _emailController;

  bool _resetButtonEnabled = true;

  void _resetPassword(BuildContext context) {
    if (ui_utils.isEmailValid(_emailController.text.trim()) == null) {
      bloc.add(ResetPasswordEvent.onResetPassword(
          email: _emailController.text.trim()));
    } else {
      ui_utils.sendScaffoldMessage(context, message: 'Enter a valid data');
      setState(() => _resetButtonEnabled = true);
    }
  }

  void _showDialogSucces(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text('Password reset link send! Check your email'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    bloc = ResetPasswordBloc();

    _emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    bloc.close();

    _emailController.dispose();

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
        child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
          bloc: bloc,
          listener: (context, state) => state.when<void>(
            empty: () {},
            success: () {
              _showDialogSucces(context);
              setState(() => _resetButtonEnabled = true);
            },
            error: (message) {
              ui_utils.sendScaffoldMessage(context, message: message);
              setState(() => _resetButtonEnabled = true);
            },
            noNetwork: () {
              ui_utils.sendScaffoldMessage(context,
                  message: 'No internet connection');
              setState(() => _resetButtonEnabled = true);
            },
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ..._buildTitle(context),
                  const SizedBox(height: 30),
                  _buildFields(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTitle(BuildContext context) {
    return [
      AutoSizeText(
        "Forgot password?",
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        minFontSize: 20,
      ),
      const SizedBox(height: 20),
      Text(
        "Enter You Email and we will send you a password reset link",
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Colors.white70),
        textAlign: TextAlign.center,
      ),
    ];
  }

  Widget _buildFields(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
        controller: _emailController,
        fieldHeight: MediaQuery.of(context).size.height / 16,
        type: CustomTextFormFieldType.email,
        validator: (value) => ui_utils.isEmailValid(value ?? ''),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: TextButton(
            onPressed: _resetButtonEnabled
                ? () {
                    setState(() => _resetButtonEnabled = false);
                    _resetPassword(context);
                  }
                : null,
            child: const Text("Reset password"),
          ),
        ),
      ),
    ]);
  }
}
