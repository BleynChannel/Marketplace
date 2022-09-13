import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/achievement.dart';
import 'package:marketplace/domain/entity/product.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/debugData.dart';
import 'package:marketplace/presentation/utils.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';

class ProfilePage extends StatelessWidget {
  void _onMenuClick(BuildContext context) {}

  void _onProductClick(BuildContext context, Product product) {}

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double purchasesHeaderHeight = MediaQuery.of(context).size.height / 9;

    return Scaffold(
      body: BackgroundBlur(
        child: SafeArea(
          top: false,
          child: CustomScrollView(slivers: [
            SliverPersistentHeader(
              delegate: _ProfileSliverAppBar(
                expandedAppBarHeight: MediaQuery.of(context).size.height / 2.6,
                minExpandedHeight:
                    kToolbarHeight + MediaQuery.of(context).padding.top,
                expandedPurchasesHeaderHeight: purchasesHeaderHeight,
                nickname: debugProfile.nickname,
                pathToAvatar: debugProfile.pathToAvatar,
                pathToBackgroundImage: debugProfile.pathToBackgroundImage,
                status: debugProfile.status,
                onMenuActionClick: _onMenuClick,
                purchases: debugProfile.purchases,
                desired: debugProfile.desired,
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 10),
                _buildCategory(
                  context,
                  title: "Contact",
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: debugProfile.contacts
                          .map((contact) => _buildContactItem(
                                context,
                                size: MediaQuery.of(context).size.width / 8,
                                name: contact,
                              ))
                          .toList()
                          .expand(
                              (element) => [element, const SizedBox(width: 10)])
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildCategory(
                  context,
                  title: "Achievements",
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: debugProfile.achievements
                          .map((achievement) => _buildAchievementItem(
                                context,
                                width: MediaQuery.of(context).size.width / 2,
                                achievement: achievement,
                              ))
                          .toList()
                          .expand(
                              (element) => [element, const SizedBox(width: 10)])
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildCategory(
                  context,
                  title: "Favorite Games",
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: debugProfile.favoriteGames
                          .map((product) => _buildFavoriteGameItem(
                                context,
                                width: MediaQuery.of(context).size.width / 2,
                                product: product,
                              ))
                          .toList()
                          .expand(
                              (element) => [element, const SizedBox(width: 10)])
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildCategory(
                  context,
                  title: "Other Information",
                  child: _buildOtherInformationList(
                    context,
                    registrationDate: debugProfile.registrationDate,
                    lastActivity: debugProfile.lastActivity,
                  ),
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildCategory(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        child,
      ]),
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required double size,
    required String name,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(size / 4),
        boxShadow: [
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 8,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          getPathToSvgIconsContacts(name) ?? "",
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildAchievementItem(
    BuildContext context, {
    required double width,
    required Achievement achievement,
  }) {
    final double height = width / 1.8;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(height / 6),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            blurRadius: 8,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              achievement.pathToIcon,
              fit: BoxFit.contain,
            ),
            const Expanded(child: SizedBox()),
            Text(
              achievement.title,
              style: GoogleFonts.roboto(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              achievement.description,
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.white70),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteGameItem(
    BuildContext context, {
    required double width,
    required Product product,
  }) {
    final double height = width / 1.5;

    return SizedBox(
      width: width,
      height: height,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: Image.asset(product.pathToImage).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => _onProductClick(context, product),
              ),
            ),
          ]),
        ),
        const SizedBox(height: 4),
        Text(
          product.title,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.white.withOpacity(0.9),
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ]),
    );
  }

  Widget _buildOtherInformationList(
    BuildContext context, {
    required DateTime registrationDate,
    required DateTime lastActivity,
  }) {
    final informations = {
      'Registration date': dateTimeToString(registrationDate),
      'Last activity': dateTimeToString(lastActivity),
    };

    return Column(
      children: informations.entries
          .map((info) {
            return Row(children: [
              Text(
                "${info.key}:",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                info.value,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ]);
          })
          .toList()
          .expand((element) => [element, const SizedBox(height: 4)])
          .toList(),
    );
  }
}

class _ProfileSliverAppBar extends SliverPersistentHeaderDelegate {
  late Map<String, int> _purchasesMap;

  final double expandedAppBarHeight;
  final double minExpandedHeight;
  final double expandedPurchasesHeaderHeight;

  final String nickname;
  final String pathToAvatar;
  final String pathToBackgroundImage;
  final String status;

  final int purchases;
  final int desired;

  final void Function(BuildContext context) onMenuActionClick;

  _ProfileSliverAppBar({
    required this.expandedAppBarHeight,
    required this.minExpandedHeight,
    required this.expandedPurchasesHeaderHeight,
    required this.nickname,
    required this.pathToAvatar,
    required this.pathToBackgroundImage,
    required this.status,
    required this.onMenuActionClick,
    required this.purchases,
    required this.desired,
  }) {
    _purchasesMap = {
      'Purchases': purchases,
      'Desired': desired,
    };
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    return Stack(
      children: [
        ClipPath(
          clipper: _ProfileAppBarClipper(
            bottomRadius:
                lerpDouble(expandedPurchasesHeaderHeight / 2, 0, progress) ?? 0,
          ),
          child: AppBar(
            backgroundColor: Color.lerp(
                Colors.black.withOpacity(0), backgroundColor, progress),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () => onMenuActionClick(context),
                icon: const Icon(Icons.menu),
              ),
            ],
            flexibleSpace: Stack(children: [
              Positioned(
                top: lerpDouble(0, -minExtent, progress),
                width: MediaQuery.of(context).size.width,
                height: maxExtent,
                child: Opacity(
                  opacity: 1 - progress,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset(pathToBackgroundImage).image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: expandedPurchasesHeaderHeight / 2,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox.square(
                            dimension: MediaQuery.of(context).size.width / 4,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                gradient: const LinearGradient(
                                  colors: [
                                    gradientStartColor,
                                    gradientStopColor
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.asset(
                                    pathToAvatar,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            nickname,
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      letterSpacing: 1,
                                    ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            status,
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      letterSpacing: 1,
                                      color: getStatusColor(status),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        Positioned(
          top: lerpDouble(
            maxExtent - expandedPurchasesHeaderHeight,
            -expandedPurchasesHeaderHeight,
            progress,
          ),
          width: MediaQuery.of(context).size.width,
          height: expandedPurchasesHeaderHeight,
          child: Opacity(
            opacity:
                clampDouble(1 - (shrinkOffset / (maxExtent - minExtent)), 0, 1),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [gradientStartColor, gradientStopColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(4, 4),
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Row(
                    children: _purchasesMap.entries
                        .map((e) {
                          return Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e.value.toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  e.key,
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                        .toList()
                        .expand((element) => [
                              element,
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: GradientDevider(isHorizontal: false),
                              ),
                            ])
                        .take(_purchasesMap.length * 2 - 1)
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent =>
      expandedAppBarHeight + expandedPurchasesHeaderHeight / 2;

  @override
  double get minExtent => minExpandedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _ProfileAppBarClipper extends CustomClipper<Path> {
  final double bottomRadius;

  _ProfileAppBarClipper({this.bottomRadius = 10.0});

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..arcToPoint(
        Offset(size.width - bottomRadius, size.height - bottomRadius),
        radius: Radius.circular(bottomRadius),
        clockwise: false,
      )
      ..lineTo(bottomRadius, size.height - bottomRadius)
      ..arcToPoint(
        Offset(0, size.height),
        radius: Radius.circular(bottomRadius),
        clockwise: false,
      )
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return (oldClipper as _ProfileAppBarClipper).bottomRadius != bottomRadius;
  }
}
