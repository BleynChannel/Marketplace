import 'package:flutter/material.dart';

class ExpansionCategory extends StatefulWidget {
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
  State<ExpansionCategory> createState() => _ExpansionCategoryState();
}

class _ExpansionCategoryState extends State<ExpansionCategory> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: widget.title,
      expandedAlignment: Alignment.topLeft,
      initiallyExpanded: widget.initiallyExpanded,
      childrenPadding: const EdgeInsets.symmetric(vertical: 12),
      children: [widget.child],
    );
  }
}
