import 'package:flutter/material.dart';

class ExpansionCategory extends StatelessWidget {
  final Widget title;
  final Widget child;
  final bool initiallyExpanded;

  const ExpansionCategory({
    Key? key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: title,
      expandedAlignment: Alignment.topLeft,
      initiallyExpanded: initiallyExpanded,
      childrenPadding: const EdgeInsets.symmetric(vertical: 12),
      children: [child],
    );
  }
}
