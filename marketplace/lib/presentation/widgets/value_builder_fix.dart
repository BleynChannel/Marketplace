import 'dart:async';

import 'package:flutter/material.dart';

typedef ValueBuilderUpdateCallback<T> = void Function(T snapshot);
typedef ValueBuilderBuilder<T> = Widget Function(
    T? snapshot, ValueBuilderUpdateCallback<T> updater);

//Фикс ValueBuilder из Get с поддержкой NullSafety
class ValueBuilderFix<T> extends StatefulWidget {
  final T? initialValue;
  final ValueBuilderBuilder<T> builder;
  final void Function()? onDispose;
  final void Function(T)? onUpdate;

  const ValueBuilderFix({
    Key? key,
    this.initialValue,
    this.onDispose,
    this.onUpdate,
    required this.builder,
  }) : super(key: key);

  @override
  _ValueBuilderFixState<T> createState() => _ValueBuilderFixState<T>();
}

class _ValueBuilderFixState<T> extends State<ValueBuilderFix<T>> {
  T? value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) => widget.builder(value, updater);

  void updater(T newValue) {
    if (widget.onUpdate != null) {
      widget.onUpdate!(newValue);
    }
    setState(() {
      value = newValue;
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose?.call();
    if (value is ChangeNotifier) {
      (value as ChangeNotifier?)?.dispose();
    } else if (value is StreamController) {
      (value as StreamController?)?.close();
    }
    value = null;
  }
}
