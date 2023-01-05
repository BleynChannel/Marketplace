import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/presentation/bloc/discover/discover_bloc.dart';
import 'package:marketplace/presentation/bloc/discover/discover_event.dart';
import 'package:marketplace/presentation/bloc/discover/discover_state.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/category_list.dart';
import 'package:marketplace/presentation/widgets/platform_chips.dart';
import 'package:marketplace/presentation/widgets/price_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  static const int _shimerCategoryCount = 3;
  static const int _shimerProductCount = 3;

  late DiscoverBloc bloc;

  void _onCartClick(BuildContext context) {
    context.router.navigateNamed('/cart');
  }

  void _onNotificationClick(BuildContext context) {
    context.router.navigateNamed('/notification');
  }

  void _onPlatformsSelected(BuildContext context, List<String> selected) {}

  void _onProductClick(BuildContext context, CompactProduct product) {
    context.router.push(ProductRoute(compactProduct: product));
  }

  @override
  void initState() {
    bloc = DiscoverBloc()..add(const DiscoverEvent.onLoaded());

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundBlur(
        child: BlocBuilder<DiscoverBloc, DiscoverState>(
          bloc: bloc,
          builder: (context, state) {
            return state.when<Widget>(
              load: () => _buildMain(context, products: null),
              loading: (products) => _buildMain(context, products: products),
              error: (message) => _buildError(context, message: message),
              noNetwork: () => _buildError(context, message: 'No network'),
            );
          },
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, {required String message}) {
    //TODO: Добавить circular progress для обновления состаяния
    return Center(
      child: Text(message),
    );
  }

  Widget _buildMain(BuildContext context,
      {required Map<String, List<CompactProduct>>? products}) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          delegate: _HomeSliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 3,
            minExpandedHeight:
                kToolbarHeight + MediaQuery.of(context).padding.top,
            productList: products?['Main'],
            onCartClick: _onCartClick,
            onNotificationClick: _onNotificationClick,
            onProductClick: _onProductClick,
          ),
          pinned: true,
        ),
        SliverPinnedHeader(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            height: 40,
            color: backgroundColor.withOpacity(0.8),
            child: PlatformChips(
              platforms: Platform.values
                  .map((e) => ui_utils.platformToName(e))
                  .toList(),
              onSelected: (selected) => _onPlatformsSelected(context, selected),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildCategoryProducts(
              context,
              category: products?.entries.elementAt(index),
            ),
            childCount: products?.length ?? _shimerCategoryCount,
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
      ],
    );
  }

  Widget _buildCategoryProducts(
    BuildContext context, {
    MapEntry<String, List<CompactProduct>>? category,
  }) {
    final itemWidth = MediaQuery.of(context).size.width / 1.8;
    final itemHeight = itemWidth / 1.6;
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: CategoryList(
        title: category != null
            ? Text(
                category.key,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              )
            : SizedBox(
                height: Theme.of(context).textTheme.headline5?.fontSize,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: (category?.value ??
                    List<CompactProduct?>.generate(
                        _shimerProductCount, (index) => null))
                .map((product) => _buildProductItem(
                      itemWidth: itemWidth,
                      itemHeight: itemHeight,
                      product: product,
                    ))
                .expand((element) => [element, const SizedBox(width: 10)])
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem({
    required double itemWidth,
    required double itemHeight,
    required CompactProduct? product,
  }) {
    return SizedBox(
      width: itemWidth,
      height: itemHeight,
      child: Column(children: [
        Expanded(
          child: product != null
              ? Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image:
                              Image.memory(product.banner.data.toImage()).image,
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
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 4),
        product != null
            ? Row(
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
                  PriceWidget(
                    price: product.price,
                    fontSize: 12,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              )
            : SizedBox(
                height: 16,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
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

  final List<CompactProduct>? productList;

  _HomeSliverAppBar({
    required this.minExpandedHeight,
    required this.expandedHeight,
    this.productList,
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
          tooltip: 'Cart',
        ),
        IconButton(
          onPressed: () => onNotificationClick(context),
          icon: SvgPicture.asset("assets/icons/bell.svg"),
          tooltip: 'Notification',
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
              child: DiscoverPageView(
                itemBuilder: (context, index) =>
                    _buildProductItem(context, productList?[index]),
                itemCount: debugProductList.length,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(BuildContext context, CompactProduct? product) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: product != null
          ? Stack(children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.memory(product.banner.data.toImage()).image,
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
                              PriceWidget(price: product.price, fontSize: 14),
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
            ])
          : Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
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

class DiscoverPageView extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const DiscoverPageView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
  }) : super(key: key);

  @override
  _DiscoverPageViewState createState() => _DiscoverPageViewState();
}

class _DiscoverPageViewState extends State<DiscoverPageView> {
  final _carouselController = CarouselController();
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: widget.itemCount,
              itemBuilder: (context, index, realIndex) =>
                  widget.itemBuilder(context, index),
              carouselController: _carouselController,
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 0.75,
                autoPlay: true,
                onPageChanged: (index, reason) =>
                    setState(() => _activeIndex = index),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        AnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          count: widget.itemCount,
          effect: const ExpandingDotsEffect(
            activeDotColor: accentColor,
            dotColor: Colors.white70,
            dotWidth: 16,
            dotHeight: 8,
            expansionFactor: 2,
          ),
          onDotClicked: (index) => setState(() {
            _activeIndex = index;
            _carouselController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }),
        ),
      ],
    );
  }
}
