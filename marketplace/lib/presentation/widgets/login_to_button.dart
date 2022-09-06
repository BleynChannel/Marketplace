import 'package:flutter/material.dart';
import 'package:marketplace/presentation/colors.dart';

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
        side: const BorderSide(color: primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
