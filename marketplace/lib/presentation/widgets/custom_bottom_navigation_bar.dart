import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/presentation/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Map<String, IconData> items;
  final int currentIndex;
  final void Function(int index) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  static const Color defaultColor = Colors.white70;
  static const Color activeColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: AnimatedBottomNavigationBar.builder(
            elevation: 0,
            gapLocation: GapLocation.center,
            notchMargin: 4,
            notchSmoothness: NotchSmoothness.softEdge,
            leftCornerRadius: 24,
            rightCornerRadius: 24,
            backgroundGradient: const LinearGradient(
              colors: [gradientStartColor, gradientStopColor],
              begin: Alignment.topLeft,
              end: Alignment(1, 2),
            ),
            splashColor: activeColor,
            itemCount: items.length,
            tabBuilder: (index, isActive) => _buildItem(index, isActive),
            activeIndex: currentIndex,
            onTap: onTap,
          ),
        ),
        Container(
          height: MediaQuery.of(context).padding.bottom,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [gradientStartColor, gradientStopColor],
              begin: Alignment(-1, -2),
              end: Alignment.bottomRight,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildItem(int index, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          items.entries.elementAt(index).value,
          color: isActive ? activeColor : defaultColor,
        ),
        const SizedBox(height: 2),
        Text(
          items.entries.elementAt(index).key,
          style: TextStyle(
            color: isActive ? activeColor : defaultColor,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
