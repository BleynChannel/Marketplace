import 'package:flutter/material.dart';
import 'package:marketplace/presentation/widgets/custom_form.dart';

enum CustomTextFormFieldType {
  none,
  email,
  password,
}

class CustomTextFormField extends StatefulWidget {
  final CustomTextFormFieldType type;
  final String? hintText;
  final Widget? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool autofocus;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final double? fieldHeight;
  final String? questionText;
  final TextEditingController? controller;

  const CustomTextFormField({
    Key? key,
    required this.type,
    this.hintText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.fieldHeight,
    this.questionText,
    this.controller,
  }) : super(key: key);

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField>
    with SingleTickerProviderStateMixin {
  late String? _hintText;
  late Widget? _prefixIcon;
  late Widget? _suffixIcon;
  late TextInputType? keyboardType;

  late AnimationController _controller;

  bool _hidePassword = false;

  late String _value;

  String _validateText = "";
  String _counter = "";

  bool get hasError => _validateText.isNotEmpty;

  bool validate() {
    setState(() {
      _validate();
    });

    return !hasError;
  }

  void _validate() {
    if (widget.validator != null) {
      final validateTextOrNull = widget.validator!(_value);

      _validateText = validateTextOrNull ?? '';
      if (validateTextOrNull != null) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void initState() {
    _value = '';

    _controller = _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _controller.addListener(() => setState(() {}));

    switch (widget.type) {
      case CustomTextFormFieldType.none:
        _hintText = null;
        _prefixIcon = null;
        _suffixIcon = null;
        keyboardType = null;
        break;
      case CustomTextFormFieldType.email:
        _hintText = 'Email';
        _prefixIcon = const Icon(Icons.email_outlined);
        _suffixIcon = null;
        keyboardType = TextInputType.emailAddress;
        break;
      case CustomTextFormFieldType.password:
        _hintText = 'Password';
        _prefixIcon = const Icon(Icons.lock_outline);
        _suffixIcon = IconButton(
          icon: const Icon(Icons.visibility_outlined),
          onPressed: () => setState(() => _hidePassword = !_hidePassword),
        );

        keyboardType = null;
        _hidePassword = true;
        break;
    }

    _hintText = widget.hintText ?? _hintText;
    _prefixIcon = widget.prefixIcon ?? _prefixIcon;
    _suffixIcon = widget.suffixIcon ?? _suffixIcon;
    _counter = widget.maxLength != null ? '0/${widget.maxLength}' : "";

    super.initState();
  }

  @override
  void deactivate() {
    CustomForm.of(context)?.unregister(this);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    CustomForm.of(context)?.register(this);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.fieldHeight,
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: _hintText,
              prefixIcon: _prefixIcon,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _suffixIcon ?? const SizedBox(),
                    widget.questionText != null
                        ? Tooltip(
                            decoration: BoxDecoration(
                              color: theme.inputDecorationTheme.focusedBorder
                                  ?.borderSide.color,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.lerp(
                                        theme.inputDecorationTheme.focusedBorder
                                            ?.borderSide.color,
                                        Colors.black,
                                        0.4) ??
                                    Colors.white,
                                width: 2,
                              ),
                            ),
                            textStyle: theme.textTheme.bodyText2?.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            triggerMode: TooltipTriggerMode.tap,
                            message: widget.questionText,
                            child: const Icon(Icons.help_outline_rounded),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              counterText: '',
            ),
            autofocus: widget.autofocus,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            maxLength: widget.maxLength,
            obscureText: _hidePassword,
            onChanged: (value) {
              _value = value;

              setState(() {
                _counter = widget.maxLength != null
                    ? '${value.length}/${widget.maxLength}'
                    : '';

                _validate();

                if (widget.onChanged != null) widget.onChanged!(value);
              });
            },
          ),
        ),
        Row(children: [
          Expanded(
            child: _validateText.isNotEmpty
                ? FadeTransition(
                    opacity: _controller,
                    child: FractionalTranslation(
                      translation: Tween<Offset>(
                        begin: const Offset(0.0, -0.25),
                        end: Offset.zero,
                      ).evaluate(_controller.view),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Text(
                          _validateText,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Theme.of(context).errorColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                : (widget.helperText ?? const SizedBox()),
          ),
          _counter.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Text(
                    _counter,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                )
              : const SizedBox(),
        ]),
      ],
    );
  }
}
