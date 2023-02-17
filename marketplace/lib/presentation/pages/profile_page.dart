import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:marketplace/domain/entity/achievement.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/contact.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/profile.dart';
import 'package:marketplace/domain/entity/status.dart';
import 'package:marketplace/presentation/bloc/profile/profile_bloc.dart';
import 'package:marketplace/presentation/bloc/profile/profile_event.dart';
import 'package:marketplace/presentation/bloc/profile/profile_state.dart';
import 'package:marketplace/core/const/colors.dart';
import 'package:marketplace/core/utils/utils.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/category_list.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  final ProfileBloc bloc;

  final String id;

  ProfilePage({Key? key, @PathParam() required this.id})
      : bloc = ProfileBloc()..add(ProfileEvent.onLoaded(userId: id)),
        super(key: key);

  void _onRefreshPage(BuildContext context) {
    bloc.add(ProfileEvent.onLoaded(userId: id));
  }

  void _onMenuClick(BuildContext context) {
    context.router.navigateNamed('/home/menu/:profile');
  }

  void _onProductClick(BuildContext context, CompactProduct product) {
    context.router.pushNamed('/product/${product.id}');
  }

  void _onContactClick(BuildContext context, Contact contact) async {
    //TODO: После появлении базы данных качать иконки от туда

    var url = Uri.parse(contact.url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: bloc,
      builder: (context, state) {
        return state.when<Widget>(
          load: () => _buildLoaded(context),
          loading: (profile) => _buildMain(context, profile: profile),
          error: (message) => _buildError(context, message: message),
          noNetwork: () => _buildError(context, message: 'noInternet'.tr),
        );
      },
    );
  }

  Widget _buildError(BuildContext context, {required String message}) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BackgroundBlur(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              ElevatedButton(
                onPressed: () => _onRefreshPage(context),
                child: Text('refreshPage'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoaded(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BackgroundBlur(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: const AspectRatio(
              aspectRatio: 1,
              child: LoadingIndicator(
                indicatorType: Indicator.pacman,
                colors: [AppColors.primaryColor, AppColors.accentColor],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMain(BuildContext context, {required Profile profile}) {
    final purchasesHeaderHeight = MediaQuery.of(context).size.height / 9;

    return Scaffold(
      body: BackgroundBlur(
        child: CustomScrollView(slivers: [
          SliverPersistentHeader(
            delegate: _ProfileSliverAppBar(
              expandedAppBarHeight: MediaQuery.of(context).size.height / 2.6,
              minExpandedHeight:
                  kToolbarHeight + MediaQuery.of(context).padding.top,
              expandedPurchasesHeaderHeight: purchasesHeaderHeight,
              nickname: profile.nickname,
              avatar: profile.avatar,
              backgroundImage: profile.backgroundImage,
              status: profile.status,
              onMenuActionClick: _onMenuClick,
              purchases: profile.purchases,
              desired: profile.desired,
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 10),
              _buildCategory(
                context,
                title: 'profileContact'.tr,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  child: Row(
                    children: profile.contacts
                        .map((contact) => _buildContactItem(
                              context,
                              size: MediaQuery.of(context).size.width / 8,
                              contact: contact,
                              onTap: (contact) =>
                                  _onContactClick(context, contact),
                            ))
                        .expand(
                            (element) => [element, const SizedBox(width: 10)])
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildCategory(
                context,
                title: 'profileAchievements'.tr,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  child: Row(
                    children: profile.achievements
                        .map((achievement) => _buildAchievementItem(
                              context,
                              width: MediaQuery.of(context).size.width / 2,
                              achievement: achievement,
                            ))
                        .expand(
                            (element) => [element, const SizedBox(width: 10)])
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildCategory(
                context,
                title: 'profileFavoriteGames'.tr,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  child: Row(
                    children: profile.favoriteGames
                        .map((product) => _buildFavoriteGameItem(
                              context,
                              width: MediaQuery.of(context).size.width / 2,
                              product: product,
                            ))
                        .expand(
                            (element) => [element, const SizedBox(width: 10)])
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildCategory(
                context,
                title: 'profileOtherInformation'.tr,
                child: _buildOtherInformationList(
                  context,
                  registrationDate: profile.registrationDate,
                  lastActivity: profile.lastActivity,
                ),
              )
            ]),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
        ]),
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
      child: ListCategory(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required double size,
    required Contact contact,
    required void Function(Contact contact) onTap,
  }) {
    return Tooltip(
      message: contact.name,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(size / 4),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 8,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Stack(children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.memory(
                contact.icon.data.toImage(),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(size / 4),
              onTap: () => onTap(contact),
            ),
          ),
        ]),
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
        color: AppColors.secondaryColor,
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
              achievement.icon,
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
    required CompactProduct product,
  }) {
    final double height = width / 1.5;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: Image.memory(product.banner.data.toImage()).image,
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
        ],
      ),
    );
  }

  Widget _buildOtherInformationList(
    BuildContext context, {
    required DateTime registrationDate,
    required DateTime lastActivity,
  }) {
    final informations = {
      'profileOtherInformationRegistrationDate'.tr: Utils.dateTimeToString(registrationDate),
      'profileOtherInformationLastActivity'.tr: Utils.dateTimeToString(lastActivity),
    };

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          border: Border.all(
            width: 2,
            color: Color.lerp(AppColors.secondaryColor, Colors.grey, 0.3) ??
                Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 16,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Theme(
            data: Theme.of(context).copyWith(
              listTileTheme: ListTileThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: Column(
              children: informations.entries
                  .map((info) {
                    return ListTile(
                      title: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: "${info.key}: ",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: info.value,
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
                  .toList(),
            )),
      ),
    );
  }
}

class _ProfileSliverAppBar extends SliverPersistentHeaderDelegate {
  late Map<String, int> _purchasesMap;

  final double expandedAppBarHeight;
  final double minExpandedHeight;
  final double expandedPurchasesHeaderHeight;

  final String nickname;
  final Media avatar;
  final Media backgroundImage;
  final Status status;

  final int purchases;
  final int desired;

  final void Function(BuildContext context) onMenuActionClick;

  _ProfileSliverAppBar({
    required this.expandedAppBarHeight,
    required this.minExpandedHeight,
    required this.expandedPurchasesHeaderHeight,
    required this.nickname,
    required this.avatar,
    required this.backgroundImage,
    required this.status,
    required this.onMenuActionClick,
    required this.purchases,
    required this.desired,
  }) {
    _purchasesMap = {
      'profilePurchases'.tr: purchases,
      'desired'.tr: desired,
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
            backgroundColor: Color.lerp(Colors.black.withOpacity(0),
                AppColors.backgroundColor, progress),
            actions: [
              IconButton(
                onPressed: () => onMenuActionClick(context),
                icon: const Icon(Icons.menu),
                tooltip: 'menu'.tr,
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
                        image:
                            Image.memory(backgroundImage.data.toImage()).image,
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
                                  child: Image.memory(
                                    avatar.data.toImage(),
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
                            status.title,
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      letterSpacing: 1,
                                      color: status.color,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.gradientStartColor,
                      AppColors.gradientStopColor
                    ],
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
