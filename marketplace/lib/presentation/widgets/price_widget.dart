import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/price.dart';

//TODO: Сделать отдельный виджет для указания цены товара
class PriceWidget extends StatelessWidget {
  final Price price;

  final double fontSize;
  late TextStyle priceStyle;
  late TextStyle oldPriceStyle;
  late TextStyle discontStyle;

  final double spacing;
  final TextDirection textDirection;

  PriceWidget({
    Key? key,
    required this.price,
    required this.fontSize,
    this.priceStyle = const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    this.oldPriceStyle = const TextStyle(
      decoration: TextDecoration.lineThrough,
    ),
    this.discontStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.lightGreen,
    ),
    this.spacing = 2.0,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key) {
    priceStyle = GoogleFonts.roboto(fontSize: fontSize).merge(priceStyle);
    oldPriceStyle = GoogleFonts.roboto(fontSize: fontSize).merge(oldPriceStyle);
    discontStyle = GoogleFonts.roboto(fontSize: fontSize).merge(discontStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: textDirection,
      children: [
        Text(
          "${price.price.ceil()} ₽",
          style: priceStyle,
        ),
        SizedBox(width: spacing),
        price.oldPrice > 0.0
            ? Text(
                "${price.oldPrice.ceil()} ₽",
                style: oldPriceStyle,
              )
            : const SizedBox(),
        SizedBox(width: spacing),
        price.discount != 0.0
            ? Text(
                "-${(price.discount * 100.0).round()}%",
                style: discontStyle,
              )
            : const SizedBox(),
      ],
    );
  }
}
