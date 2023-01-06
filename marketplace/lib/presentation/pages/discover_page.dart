import 'dart:async';
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

  late DiscoverBloc _bloc;

  void _onCartClick(BuildContext context) {
    context.router.navigateNamed('/cart');
  }

  void _onNotificationClick(BuildContext context) {
    context.router.navigateNamed('/notification');
  }

  Timer? _platformSelectTimer;
  List<Platform> _selectedPlatform = Platform.values;

  void _onPlatformsSelected(BuildContext context, List<Platform> selected) {
    _platformSelectTimer?.cancel();
    _platformSelectTimer = Timer(
      const Duration(milliseconds: 1000),
      () {
        _bloc.add(DiscoverEvent.onLoaded(selected));
        _selectedPlatform = selected;
      },
    );
  }

  Future<void> _onRefreshProducts(BuildContext context) async {
    _bloc.add(DiscoverEvent.onLoaded(_selectedPlatform));
    await Future.delayed(const Duration(milliseconds: 500));
  }

  void _onProductClick(BuildContext context, CompactProduct product) {
    context.router.push(ProductRoute(compactProduct: product));
  }

  @override
  void initState() {
    _bloc = DiscoverBloc()..add(const DiscoverEvent.onLoaded(Platform.values));

    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundBlur(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPersistentHeader(
              delegate: _HomeSliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 3,
                minExpandedHeight:
                    kToolbarHeight + MediaQuery.of(context).padding.top,
                cartCount: 7,
                notificationCount: 15,
                onCartClick: _onCartClick,
                onNotificationClick: _onNotificationClick,
                onProductClick: _onProductClick,
                bloc: _bloc,
              ),
              pinned: true,
            ),
            SliverPinnedHeader(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                height: 40,
                color: backgroundColor.withOpacity(0.8),
                child: PlatformChips(
                  onSelected: (selected) =>
                      _onPlatformsSelected(context, selected),
                ),
              ),
            ),
          ],
          body: RefreshIndicator(
            onRefresh: () async => await _onRefreshProducts(context),
            child: BlocBuilder<DiscoverBloc, DiscoverState>(
              bloc: _bloc,
              builder: (context, state) => state.when(
                load: () => _buildProductsList(context, products: null),
                loading: (products) =>
                    _buildProductsList(context, products: products),
                error: (message) =>
                    _buildProductsList(context, message: message),
                noNetwork: () =>
                    _buildProductsList(context, message: 'No network'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductsList(
    BuildContext context, {
    Map<String, List<CompactProduct>>? products,
    String? message,
  }) {
    List<Widget> children;

    // ignore: no_leading_underscores_for_local_identifiers
    final _products = products?.entries.skip(1);

    if (message != null) {
      children = [_buildError(context, message: message)];
    } else if (_products != null) {
      if (_products.every((element) => element.value.isEmpty)) {
        children = [_buildError(context, message: "Empty products")];
      } else {
        children = _products
            .map((category) => _buildCategoryProducts(
                  context,
                  category: category,
                ))
            .toList();
      }
    } else {
      children = List.generate(
          _shimerCategoryCount,
          (_) => _buildCategoryProducts(
                context,
                category: null,
              ));
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ...children,
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildError(BuildContext context, {required String message}) {
    return SizedBox(
      height: 40,
      child: Center(
        child: Text(message),
      ),
    );
  }

  Widget _buildCategoryProducts(BuildContext context,
      {MapEntry<String, List<CompactProduct>>? category}) {
    if (category != null && category.value.isEmpty) {
      return const SizedBox();
    }

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

  final int cartCount;
  final int notificationCount;

  final void Function(BuildContext context) onCartClick;
  final void Function(BuildContext context) onNotificationClick;
  final void Function(BuildContext context, CompactProduct product)
      onProductClick;

  final DiscoverBloc bloc;

  _HomeSliverAppBar({
    required this.minExpandedHeight,
    required this.expandedHeight,
    required this.cartCount,
    required this.notificationCount,
    required this.onCartClick,
    required this.onNotificationClick,
    required this.onProductClick,
    required this.bloc,
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
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset("assets/icons/cart.svg"),
              cartCount != 0
                  ? Positioned(
                      right: -7,
                      top: -7,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            cartCount > 9 ? "9+" : cartCount.toString(),
                            style: GoogleFonts.roboto(fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          tooltip: 'Cart',
        ),
        IconButton(
          onPressed: () => onNotificationClick(context),
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset("assets/icons/bell.svg"),
              notificationCount != 0
                  ? Positioned(
                      right: -7,
                      top: -7,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            notificationCount > 9
                                ? "9+"
                                : notificationCount.toString(),
                            style: GoogleFonts.roboto(fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
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
              child: BlocBuilder<DiscoverBloc, DiscoverState>(
                bloc: bloc,
                builder: (context, state) => state.when(
                  load: () => _buildMain(context, products: null),
                  loading: (products) =>
                      _buildMain(context, products: products['Main']),
                  error: (message) => _buildError(context, message),
                  noNetwork: () => _buildError(context, 'No network'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget _buildMain(BuildContext context,
      {required List<CompactProduct>? products}) {
    if (products != null && products.isEmpty) {
      return _buildError(context, "Empty products");
    }

    return DiscoverPageView(
      itemBuilder: (context, index) =>
          _buildProductItem(context, products?[index]),
      itemCount: debugProductList.length,
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
