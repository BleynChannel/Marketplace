import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/product.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:marketplace/presentation/widgets/home_page_view.dart';
import 'package:marketplace/presentation/widgets/platform_chips.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _platformList = [
    'Windows',
    'Linux',
    'MacOS',
    'Android',
    'IOS',
    'Nintendo Switch',
    'PS4',
    'Xbox One',
    'PS5',
  ];

  final List<Product> _debugMainProductList = [
    Product(
      title: 'Cyberpunk 2077',
      pathToImage: 'assets/images/cyberpunk.jpg',
      price: 999,
      oldPrice: 1999,
      discount: 0.5,
      platforms: ['Windows', 'Linux', 'MacOS'],
    ),
    Product(
      title: 'Stray',
      pathToImage: 'assets/images/stray.jpg',
      price: 699,
      oldPrice: 699,
      discount: 0,
      platforms: [
        'Windows',
        'Linux',
        'MacOS',
        'PS4',
        'Xbox One',
        'PS5',
      ],
    ),
    Product(
      title: 'Minecraft',
      pathToImage: 'assets/images/minecraft.jpg',
      price: 1299,
      oldPrice: 2499,
      discount: 0.48,
      platforms: [
        'Windows',
        'Linux',
        'MacOS',
        'Android',
        'IOS',
        'Nintendo Switch',
        'PS4',
        'Xbox One',
        'PS5',
      ],
    ),
  ];

  late Map<String, List<Product>> _debugProductList;

  void _onCartClick(BuildContext context) {
    Navigator.pushNamed(context, '/cart');
  }

  void _onNotificationClick(BuildContext context) {}

  void _onPlatformsSelected(BuildContext context, List<String> selected) {}

  void _onTapProfile() {}

  void _onBottomNavBarSelected(String pageName) {}

  @override
  void initState() {
    _debugProductList = {
      'Most Popular': _debugMainProductList,
      'Free This Week': _debugMainProductList,
      'Special Offers': _debugMainProductList,
      'You will like': _debugMainProductList,
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _onTapProfile,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        onSelected: _onBottomNavBarSelected,
      ),
      extendBody: true,
      body: BackgroundBlur(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _HomeSliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 3,
                minExpandedHeight:
                    kToolbarHeight + MediaQuery.of(context).padding.top,
                debugProductList: _debugMainProductList,
                onCartClick: _onCartClick,
                onNotificationClick: _onNotificationClick,
              ),
              pinned: true,
            ),
            SliverPinnedHeader(
              child: Container(
                padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
                color: backgroundColor.withOpacity(0.8),
                child: PlatformChips(
                  platforms: _platformList,
                  onSelected: (selected) =>
                      _onPlatformsSelected(context, selected),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildCategoryProducts(
                  context,
                  title: _debugProductList.entries.elementAt(index).key,
                  products: _debugProductList.entries.elementAt(index).value,
                ),
                childCount: _debugProductList.length,
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
    required List<Product> products,
  }) {
    final itemWidth = MediaQuery.of(context).size.width / 2.0;
    final itemHeight = itemWidth / 1.6;

    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline5),
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
                  .toList()
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
    required Product product,
  }) {
    return SizedBox(
      width: itemWidth,
      height: itemHeight,
      child: Column(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: Image.asset(product.pathToImage).image,
                fit: BoxFit.cover,
              ),
            ),
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
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.9),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  "${product.price.ceil()} ₽",
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 2),
                product.price != product.oldPrice
                    ? Text(
                        "${product.oldPrice.ceil()} ₽",
                        style: GoogleFonts.roboto(
                          fontSize: 10,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(width: 2),
                product.discount != 0
                    ? Text(
                        "${(product.discount * 100).ceil()}%",
                        style: GoogleFonts.roboto(
                          fontSize: 10,
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

  final List<Product> debugProductList;

  _HomeSliverAppBar({
    required this.minExpandedHeight,
    required this.expandedHeight,
    required this.debugProductList,
    required this.onCartClick,
    required this.onNotificationClick,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    return AppBar(
      title: const Text("Discover"),
      backgroundColor: Colors.transparent,
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
    final contentHeight = maxExtent - minExtent;
    final contentWidth = contentHeight * 1.6;
    final contentFraction = contentWidth / MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned(
          top: lerpDouble(minExtent, 0, progress),
          width: MediaQuery.of(context).size.width,
          height: contentHeight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Opacity(
              opacity: 1 - progress,
              child: HomePageView(
                itemBuilder: (context, index) =>
                    _buildProductItem(context, debugProductList[index]),
                itemCount: debugProductList.length,
                contentWidthFraction: contentFraction,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset(product.pathToImage).image,
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
                                "${product.price.ceil()} ₽",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 2),
                              product.price != product.oldPrice
                                  ? Text(
                                      "${product.oldPrice.ceil()} ₽",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    )
                                  : const SizedBox(),
                              const SizedBox(width: 2),
                              product.discount != 0
                                  ? Text(
                                      "${(product.discount * 100).ceil()}%",
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
      ),
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