import 'package:flutter/material.dart';
import 'package:marketplace/presentation/widgets/blur_circle.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Align(
          alignment: Alignment.center,
          child: BlurCircle(
            color: Color(0xFF7C1BC9),
            size: 140,
            radius: 160,
          ),
        ),
        Align(
          alignment: Alignment(1.5, 0.8),
          child: BlurCircle(
            color: Color(0xFF4ADAE3),
            size: 140,
            radius: 160,
          ),
        ),
      ],
    );
  }
}
