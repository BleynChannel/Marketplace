import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/price.dart';

class PriceWidget extends StatelessWidget {
  final Price price;

  final double fontSize;
  late final TextStyle? _priceStyle;
  late final TextStyle? _oldPriceStyle;
  late final TextStyle? _discontStyle;

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
    final kPriceStyle = priceStyle ??
        const TextStyle(
          fontWeight: FontWeight.bold,
        );
    final kOldPriceStyle = oldPriceStyle ??
        const TextStyle(
          decoration: TextDecoration.lineThrough,
        );
    final kDiscontStyle = discontStyle ??
        const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.lightGreen,
        );

    _priceStyle = GoogleFonts.roboto(fontSize: fontSize).merge(kPriceStyle);
    _oldPriceStyle =
        GoogleFonts.roboto(fontSize: fontSize).merge(kOldPriceStyle);
    _discontStyle = GoogleFonts.roboto(fontSize: fontSize).merge(kDiscontStyle);
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
