import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/price.dart';

class PriceWidget extends StatelessWidget {
  final Price price;

  final double fontSize;
  late TextStyle? _priceStyle;
  late TextStyle? _oldPriceStyle;
  late TextStyle? _discontStyle;

  final double spacing;
  final TextDirection textDirection;

  PriceWidget({
    Key? key,
    required this.price,
    required this.fontSize,
    TextStyle? priceStyle,
    TextStyle? oldPriceStyle,
    TextStyle? discontStyle,
    this.spacing = 2.0,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key) {
    _priceStyle = priceStyle ??
        const TextStyle(
          fontWeight: FontWeight.bold,
        );
    _oldPriceStyle = oldPriceStyle ??
        const TextStyle(
          decoration: TextDecoration.lineThrough,
        );
    _discontStyle = discontStyle ??
        const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.lightGreen,
        );

    _priceStyle = GoogleFonts.roboto(fontSize: fontSize).merge(_priceStyle);
    _oldPriceStyle =
        GoogleFonts.roboto(fontSize: fontSize).merge(_oldPriceStyle);
    _discontStyle = GoogleFonts.roboto(fontSize: fontSize).merge(_discontStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: textDirection,
      children: [
        Text(
          "${price.price.ceil()} ₽",
          style: _priceStyle,
        ),
        SizedBox(width: spacing),
        price.oldPrice > 0.0
            ? Text(
                "${price.oldPrice.ceil()} ₽",
                style: _oldPriceStyle,
              )
            : const SizedBox(),
        SizedBox(width: spacing),
        price.discount != 0.0
            ? Text(
                "-${(price.discount * 100.0).round()}%",
                style: _discontStyle,
              )
            : const SizedBox(),
      ],
    );
  }
}
