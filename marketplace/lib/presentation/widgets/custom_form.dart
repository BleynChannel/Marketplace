import 'package:flutter/cupertino.dart';
import 'package:marketplace/presentation/widgets/custom_text_form_field.dart';

class CustomForm extends StatefulWidget {
  final Widget child;

  static CustomFormState? of(BuildContext context) {
    final _CustomFormScope? scope =
        context.dependOnInheritedWidgetOfExactType<_CustomFormScope>();
    return scope?._formState;
  }

  const CustomForm({Key? key, required this.child}) : super(key: key);

  @override
  CustomFormState createState() => CustomFormState();
}

class CustomFormState extends State<CustomForm> {
  final Set<CustomTextFormFieldState> _fields = <CustomTextFormFieldState>{};

  void register(CustomTextFormFieldState field) {
    _fields.add(field);
  }

  void unregister(CustomTextFormFieldState field) {
    _fields.remove(field);
  }

  bool validate() {
    bool hasError = false;
    for (final CustomTextFormFieldState field in _fields) {
      hasError = !field.validate() || hasError;
    }
    return !hasError;
  }

  @override
  Widget build(BuildContext context) {
    return _CustomFormScope(
      formState: this,
      child: Form(child: widget.child),
    );
  }
}

class _CustomFormScope extends InheritedWidget {
  final CustomFormState _formState;

  const _CustomFormScope({
    required super.child,
    required CustomFormState formState,
  }) : _formState = formState;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
