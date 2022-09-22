import 'package:flutter/material.dart';

//TODO: Поменять всем, кто использует собственное создание категорий
class CategoryList extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget child;
  final bool isHidingEnabled;

  const CategoryList({
    Key? key,
    required this.title,
    this.titleStyle,
    required this.child,
    this.isHidingEnabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Text titleWidget = Text(
      title,
      style: titleStyle ??
          Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w700,
              ),
      overflow: TextOverflow.ellipsis,
    );

    return isHidingEnabled
        ? ExpansionTile(
            title: titleWidget,
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
                  child: titleWidget,
                ),
                const SizedBox(height: 8),
                child,
              ],
            ),
            contentPadding: EdgeInsets.zero,
          );
  }
}
