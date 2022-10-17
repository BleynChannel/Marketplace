import 'package:flutter/material.dart';
import 'package:marketplace/presentation/colors.dart';

class CustomRangeSlider extends StatefulWidget {
  final RangeValues values;
  final RangeValues constrainValue;
  final Function(RangeValues) onChanged;
  final String? postfixText;
  final String? suffixText;

  const CustomRangeSlider({
    Key? key,
    required this.values,
    this.constrainValue = const RangeValues(0, 100),
    required this.onChanged,
    this.postfixText,
    this.suffixText,
  }) : super(key: key);

  @override
  _CustomRangeSliderState createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  late RangeValues _values;

  void _onChanged(RangeValues values) {
    setState(() {
      _values = values;
      widget.onChanged(_values);
    });
  }

  @override
  void initState() {
    _values = widget.values;

    super.initState();
  }
  
  @override
  void didUpdateWidget(covariant CustomRangeSlider oldWidget) {
    setState(() {
      _values = widget.values;
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: (_values.start - widget.constrainValue.start).round(),
                  child: const SizedBox(),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    '${widget.postfixText ?? ''}${_values.start.round()}${widget.suffixText ?? ''}',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: (widget.constrainValue.end - _values.start).round(),
                  child: const SizedBox(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: (_values.end - widget.constrainValue.start).round(),
                  child: const SizedBox(),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    '${widget.postfixText ?? ''}${_values.end.round()}${widget.suffixText ?? ''}',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: (widget.constrainValue.end - _values.end).round(),
                  child: const SizedBox(),
                ),
              ],
            ),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            rangeThumbShape: CustomRangeThumbShape(),
            activeTrackColor: primaryColor,
            thumbColor: accentColor,
            inactiveTrackColor: Colors.grey.withOpacity(0.4),
          ),
          child: RangeSlider(
            values: _values,
            min: widget.constrainValue.start,
            max: widget.constrainValue.end,
            divisions: (widget.constrainValue.end - widget.constrainValue.start)
                .round(),
            onChanged: (values) => _onChanged(values),
          ),
        ),
      ],
    );
  }
}

class CustomRangeThumbShape extends RangeSliderThumbShape {
  static const double _thumbSize = 3.0;
  static const double _disabledThumbSize = 3.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled
        ? const Size.fromRadius(_thumbSize)
        : const Size.fromRadius(_disabledThumbSize);
  }

  static final Animatable<double> sizeTween = Tween<double>(
    begin: _disabledThumbSize,
    end: _thumbSize,
  );

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    bool? isPressed,
    required SliderThemeData sliderTheme,
    TextDirection textDirection = TextDirection.ltr,
    Thumb thumb = Thumb.start,
  }) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final Paint cPaint = Paint();
    cPaint.color = Colors.white;
    cPaint.strokeWidth = 14 / 2;
    canvas.drawCircle(Offset(center.dx, center.dy), 12, cPaint);
    cPaint.color = colorTween.evaluate(enableAnimation)!;
    canvas.drawCircle(Offset(center.dx, center.dy), 10, cPaint);
  }
}
