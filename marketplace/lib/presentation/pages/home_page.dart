import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  final Map<String, IconData> _bottomNavBarItems = {
    'Discover': Icons.home,
    'Search': Icons.search,
    'Desired': Icons.bookmark_outline,
    'Menu': Icons.menu,
  };

  HomePage({Key? key}) : super(key: key);

  void _onProfileTap(BuildContext context) {
    context.router.navigateNamed('/profile');
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DiscoverRouth(),
        SearchRouth(),
        DesiredRouth(),
        MenuRouth(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return CustomBottomNavigationBar(
          items: _bottomNavBarItems,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            gradient: const LinearGradient(
              colors: [gradientStartColor, gradientStopColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Stack(children: [
                Image.asset(
                  "assets/images/avatar.png",
                  fit: BoxFit.fill,
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _onProfileTap(context),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    );
  }
}
