import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final Widget title;
  final Widget child;
  final bool isHidingEnabled;

  const CategoryList({
    Key? key,
    required this.title,
    required this.child,
    this.isHidingEnabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isHidingEnabled
        ? ExpansionTile(
            title: title,
            expandedAlignment: Alignment.topLeft,
            initiallyExpanded: true,
            childrenPadding: const EdgeInsets.symmetric(vertical: 12),
            children: [child],
          )
        : ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: title,
                ),
                const SizedBox(height: 8),
                child,
              ],
            ),
            contentPadding: EdgeInsets.zero,
          );
  }
}
