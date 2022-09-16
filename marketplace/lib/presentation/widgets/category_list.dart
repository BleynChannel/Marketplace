import 'package:flutter/material.dart';

//TODO: Поменять всем, кто использует собственное создание категорий
class CategoryList extends StatelessWidget {
  final String title;
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
    Text titleWidget = Text(
      title,
      style: Theme.of(context).textTheme.headline6?.copyWith(
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
            title: Column(children: [
              SizedBox(
                width: double.infinity,
                child: titleWidget,
              ),
              const SizedBox(height: 8),
              child,
            ]),
          );
  }
}
