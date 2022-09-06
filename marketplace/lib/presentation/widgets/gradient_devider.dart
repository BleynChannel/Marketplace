import 'package:flutter/material.dart';

class GradientDevider extends StatelessWidget {
  final bool isHorizontal;

  const GradientDevider({
    Key? key,
    this.isHorizontal = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isHorizontal ? double.infinity : 1,
      height: isHorizontal ? 1 : double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white.withOpacity(0),
            Colors.white,
            Colors.white,
            Colors.white.withOpacity(0),
          ],
          stops: const [0, 0.2, 0.8, 1],
        ),
      ),
    );
  }
}
