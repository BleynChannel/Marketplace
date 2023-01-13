import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  final Widget title;
  final Widget child;

  const ListCategory({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
