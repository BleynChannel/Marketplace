import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/home_page_view.dart';
import 'package:marketplace/presentation/widgets/platform_chips.dart';
import 'package:sliver_tools/sliver_tools.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late Map<String, List<CompactProduct>> _debugProductMap;

  void _onCartClick(BuildContext context) {
    context.router.navigateNamed('/cart');
  }

  void _onNotificationClick(BuildContext context) {
    context.router.navigateNamed('/notification');
  }

  void _onPlatformsSelected(BuildContext context, List<String> selected) {}

  void _onProductClick(BuildContext context, CompactProduct product) {
    context.router.push(ProductRoute(product: product.toProduct()));
  }

  @override
  void initState() {
    _debugProductMap = {
      'Most Popular': debugCompactProductList,
      'Free This Week': debugCompactProductList,
      'Special Offers': debugCompactProductList,
      'You will like': debugCompactProductList,
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundBlur(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _HomeSliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 3,
                minExpandedHeight:
                    kToolbarHeight + MediaQuery.of(context).padding.top,
                debugProductList: debugCompactProductList,
                onCartClick: _onCartClick,
                onNotificationClick: _onNotificationClick,
                onProductClick: _onProductClick,
              ),
              pinned: true,
            ),
            SliverPinnedHeader(
              child: Container(
                padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
                color: backgroundColor.withOpacity(0.8),
                child: PlatformChips(
                  platforms: Platform.values
                      .map((e) => ui_utils.platformToName(e))
                      .toList(),
                  onSelected: (selected) =>
                      _onPlatformsSelected(context, selected),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildCategoryProducts(
                  context,
                  title: _debugProductMap.entries.elementAt(index).key,
                  products: _debugProductMap.entries.elementAt(index).value,
                ),
                childCount: _debugProductMap.length,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryProducts(
    BuildContext context, {
    required String title,
    required List<CompactProduct> products,
  }) {
    final itemWidth = MediaQuery.of(context).size.width / 2.0;
    final itemHeight = itemWidth / 1.6;

    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products
                  .map((product) => _buildProductItem(
                        itemWidth: itemWidth,
                        itemHeight: itemHeight,
                        product: product,
                      ))
                  .expand((element) => [element, const SizedBox(width: 10)])
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductItem({
    required double itemWidth,
    required double itemHeight,
    required CompactProduct product,
  }) {
    return SizedBox(
      width: itemWidth,
      height: itemHeight,
      child: Column(children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: Image.asset(product.banner.path).image,
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
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                product.title,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  "${product.price.price.ceil()} ₽",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 2),
                product.price.oldPrice > 0
                    ? Text(
                        "${product.price.oldPrice.ceil()} ₽",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(width: 2),
                product.price.discount != 0
                    ? Text(
                        "${(product.price.discount * 100).ceil()}%",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

class _HomeSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minExpandedHeight;

  final void Function(BuildContext context) onCartClick;
  final void Function(BuildContext context) onNotificationClick;
  final void Function(BuildContext context, CompactProduct product)
      onProductClick;

  final List<CompactProduct> debugProductList;

  _HomeSliverAppBar({
    required this.minExpandedHeight,
    required this.expandedHeight,
    required this.debugProductList,
    required this.onCartClick,
    required this.onNotificationClick,
    required this.onProductClick,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    return AppBar(
      title: Text(
        "Discover",
        style: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () => onCartClick(context),
          icon: SvgPicture.asset("assets/icons/cart.svg"),
        ),
        IconButton(
          onPressed: () => onNotificationClick(context),
          icon: SvgPicture.asset("assets/icons/bell.svg"),
        ),
      ],
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            lerpDouble(24, 0, progress) ?? 0,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [gradientStartColor, gradientStopColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _buildProductList(context, progress),
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context, double progress) {
    return Stack(
      children: [
        Positioned(
          top: lerpDouble(minExtent, 0, progress),
          width: MediaQuery.of(context).size.width,
          height: maxExtent - minExtent,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Opacity(
              opacity: 1 - progress,
              child: HomePageView(
                itemBuilder: (context, index) =>
                    _buildProductItem(context, debugProductList[index]),
                itemCount: debugProductList.length,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(BuildContext context, CompactProduct product) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset(product.banner.path).image,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            const Expanded(child: SizedBox()),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 12,
                      blurRadius: 12,
                      offset: const Offset(0, 24),
                    ),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(children: [
                              Text(
                                "${product.price.price.ceil()} ₽",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 2),
                              product.price.oldPrice > 0
                                  ? Text(
                                      "${product.price.oldPrice.ceil()} ₽",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    )
                                  : const SizedBox(),
                              const SizedBox(width: 2),
                              product.price.discount != 0
                                  ? Text(
                                      "${(product.price.discount * 100).ceil()}%",
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightGreen,
                                      ),
                                    )
                                  : const SizedBox(),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => onProductClick(context, product),
          ),
        ),
      ]),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minExpandedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
