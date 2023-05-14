import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace/core/const/colors.dart';
import 'package:marketplace/domain/repository/auth_repository.dart';
import 'package:marketplace/presentation/provider/home_avatar_provider.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/widgets/custom_bottom_navigation_bar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  final Map<String, IconData> _bottomNavBarItems = {
    'discover'.tr: Icons.home,
    'search'.tr: Icons.search,
    'desired'.tr: Icons.bookmark_outline,
    'menu'.tr: Icons.menu,
  };

  HomePage({Key? key}) : super(key: key);

  void _onProfileTap(BuildContext context) {
    final authRepository = Get.find<AuthRepository>();
    context.router.navigateNamed('/profile/${authRepository.uid!}');
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: false,
      routes: [
        DiscoverRoute(),
        SearchRoute(),
        const DesiredRoute(),
        MenuRoute(),
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
        tooltip: 'profile'.tr,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            gradient: const LinearGradient(
              colors: [
                AppColors.gradientStartColor,
                AppColors.gradientStopColor
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Stack(children: [
                ObxValue(
                  (image) => Image.memory(
                    image.value,
                    fit: BoxFit.fill,
                  ),
                  Get.find<HomeAvatarProvider>().rxImage,
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
