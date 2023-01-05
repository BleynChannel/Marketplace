import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:marketplace/domain/entity/bundle.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/product.dart';
import 'package:marketplace/domain/entity/product_dlc.dart';
import 'package:marketplace/domain/entity/product_review.dart';
import 'package:marketplace/domain/entity/system_requirement.dart';
import 'package:marketplace/presentation/bloc/product/product_bloc.dart';
import 'package:marketplace/presentation/bloc/product/product_event.dart';
import 'package:marketplace/presentation/bloc/product/product_state.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/category_list.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';
import 'package:marketplace/presentation/widgets/price_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProductPage extends StatefulWidget {
  final CompactProduct compactProduct;

  const ProductPage({
    Key? key,
    required this.compactProduct,
  }) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductBloc bloc;

  late final List<YoutubePlayerController> _controllers;
  YoutubePlayer? _currentPlayer;

  void _fillPlayerControllers(List<Media> media) {
    if (_controllers.isNotEmpty) return;

    for (var i = 0; i < media.length; i++) {
      if (media[i].type == MediaType.video) {
        _controllers.add(
          YoutubePlayerController(
            initialVideoId:
                YoutubePlayer.convertUrlToId(media[i].data.toVideo())!,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              disableDragSeek: true,
            ),
          ),
        );
      }
    }
  }

  void _onChangeCurrentPlayer(YoutubePlayer player) {
    setState(() {
      _currentPlayer = player;
    });
  }

  void _onProductClick(BuildContext context, CompactProduct product) {
    context.router.push(ProductRoute(compactProduct: product));
  }

  void _onBundleProductClick(BuildContext context, Bundle bundle) {}

  void _onBundleDesiredClick(BuildContext context, Bundle bundle) {}

  void _onCartClick(BuildContext context) {}

  void _onDesiredClick(BuildContext context) {}

  @override
  void initState() {
    _controllers = [];

    bloc = ProductBloc()..add(ProductEvent.onLoaded(widget.compactProduct));

    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }

    bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      bloc: bloc,
      builder: (context, state) {
        return state.when<Widget>(
          load: () => _buildLoaded(context),
          loading: (product) => _buildMain(context, product: product),
          error: (message) => _buildError(context, message: message),
          noNetwork: () => _buildError(context, message: 'No network'),
        );
      },
    );
  }

  Widget _buildError(BuildContext context, {required String message}) {
    //TODO: Добавить circular progress для обновления состаяния
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BackgroundBlur(
        child: Center(
          child: Text(message),
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
                colors: [primaryColor, accentColor],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMain(BuildContext context, {required Product product}) {
    _fillPlayerControllers(product.media);

    return _buildYoutubeBuilder(
      context,
      child: Scaffold(
        body: BackgroundBlur(
          child: Stack(
            children: [
              CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPersistentHeader(
                      delegate: _ProductSliverAppBar(
                        expandedHeight:
                            MediaQuery.of(context).size.height / 3.6,
                        minExpandedHeight:
                            kToolbarHeight + MediaQuery.of(context).padding.top,
                        clipRadius: 30,
                        controllers: _controllers,
                        onChangeCurrentPlayer: _onChangeCurrentPlayer,
                        title: product.title,
                        media: product.media,
                      ),
                      pinned: true,
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 10, bottom: 60),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          const SizedBox(height: 10),
                          _buildMainTitle(context, product: product),
                          _buildTagsAndPlatforms(context, product: product),
                          const SizedBox(height: 10),
                          _ProductTabBar(
                            product: product,
                            onProductClick: _onProductClick,
                            onBundleProductClick: _onBundleProductClick,
                            onBundleDesiredClick: _onBundleDesiredClick,
                          ),
                        ]),
                      ),
                    ),
                  ]),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 20,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                    colors: [
                                      gradientStartColor,
                                      gradientStopColor
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 2),
                                    ),
                                  ),
                                  onPressed: () => _onCartClick(context),
                                  child: const Text(
                                    'Add to Cart',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IntrinsicHeight(
                            child: SizedBox.square(
                              dimension:
                                  MediaQuery.of(context).size.height / 20,
                              child: Tooltip(
                                message: 'Add to Desired',
                                child: TextButton(
                                  onPressed: () => _onDesiredClick(context),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(0)),
                                  ),
                                  child: const Icon(Icons.bookmark_outline,
                                      size: 20),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYoutubeBuilder(BuildContext context, {required Widget child}) {
    return _currentPlayer != null
        ? YoutubePlayerBuilder(
            player: _currentPlayer!,
            builder: (context, _) => child,
          )
        : child;
  }

  //Main information title
  Widget _buildMainTitle(BuildContext context, {required Product product}) {
    return Row(children: [
      Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [gradientStartColor, gradientStopColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: Image.memory(product.icon.data.toImage()).image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Wrap(
              spacing: 8,
              children: {
                product.rating.toStringAsFixed(1): const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                ui_utils.getCompactCount(product.countBuy): const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.lightGreen,
                ),
                ui_utils.releaseDateToString(product.releaseDate): const Icon(
                  Icons.schedule,
                  color: Colors.grey,
                ),
              }.entries.map((e) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    e.value,
                    const SizedBox(width: 4),
                    Text(
                      e.key,
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 2),
            PriceWidget(
              price: product.price,
              fontSize: 18,
              spacing: 4,
            ),
          ],
        ),
      ),
    ]);
  }

  //Tags and Platforms
  Widget _buildTagsAndPlatforms(BuildContext context,
      {required Product product}) {
    final Map<String, Map<List<String>, VoidCallback>> tagsAndPlatforms = {
      'Tags': {
        product.genre: () {},
        product.stylistics: () {},
        product.multiplayer: () {},
      },
      'Platforms': {
        product.platforms
            .map((platform) => ui_utils.platformToName(platform))
            .toList(): () {}
      },
    };

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tagsAndPlatforms.entries
            .map((e) => _buildTagsAndPlatformsCategory(context,
                title: e.key, items: e.value))
            .toList(),
      ),
    );
  }

  Widget _buildTagsAndPlatformsCategory(
    BuildContext context, {
    required String title,
    required Map<List<String>, VoidCallback> items,
  }) {
    final List<Widget> chips = items.entries
        .expand((e1) => [
              ...e1.key.map((e2) => _buildTagsAndPlatformsChip(
                    context,
                    title: e2,
                    onPressed: e1.value,
                  ))
            ])
        .toList();

    return CategoryList(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6?.copyWith(
              fontWeight: FontWeight.w700,
            ),
        overflow: TextOverflow.ellipsis,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: chips
              .expand((element) => [element, const SizedBox(width: 8)])
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTagsAndPlatformsChip(
    BuildContext context, {
    required String title,
    required void Function() onPressed,
  }) {
    return ActionChip(
      label: Text(
        title,
        style: Theme.of(context).textTheme.caption?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: primaryColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      backgroundColor: Colors.transparent,
      onPressed: onPressed,
    );
  }
}

class _ProductSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minExpandedHeight;
  final double clipRadius;

  final List<YoutubePlayerController> controllers;
  final void Function(YoutubePlayer) onChangeCurrentPlayer;

  final String title;
  late final List<Media> _media;

  // void _onPageChanged(int index) {
  //   if (_media[index].type == MediaType.video) {
  //     onChangeCurrentPlayer(players[index]);
  //   }
  // }

  _ProductSliverAppBar({
    required this.expandedHeight,
    required this.minExpandedHeight,
    required this.clipRadius,
    required this.controllers,
    required this.onChangeCurrentPlayer,
    required this.title,
    required List<Media> media,
  }) : _media = [...media.reversed]
          ..sort((a, b) => a.type == MediaType.video ? -1 : 1);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    return Stack(
      children: [
        ClipPath(
          clipper: _ProductAppBarClipper(
            bottomRadius: lerpDouble(clipRadius, 0, progress) ?? 0,
          ),
          child: AppBar(
            title: Transform(
              transform: Matrix4.translationValues(
                  0, lerpDouble(maxExtent, 0, progress) ?? 0, 0),
              child: Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            centerTitle: false,
            backgroundColor: Color.lerp(
                Colors.black.withOpacity(0), backgroundColor, progress),
            flexibleSpace: Stack(children: [
              Positioned(
                top: lerpDouble(0, -minExtent, progress),
                width: MediaQuery.of(context).size.width,
                height: maxExtent,
                child: Opacity(
                  opacity: 1 - progress,
                  child: _ProductPageView(
                    height: maxExtent,
                    clipRadius: clipRadius,
                    itemBuilder: (context, index) => _buildMediaItem(
                      context,
                      mediaItem: _media[index],
                      index: index,
                    ),
                    itemCount: _media.length,
                    // onPageChanged: _onPageChanged,
                  ),
                ),
              ),
            ]),
          ),
        ),
        Positioned(
          top: lerpDouble(
            maxExtent - clipRadius / 2,
            0,
            progress,
          ),
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity:
                clampDouble(1 - (shrinkOffset / (maxExtent - minExtent)), 0, 1),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMediaItem(
    BuildContext context, {
    required Media mediaItem,
    required int index,
  }) {
    switch (mediaItem.type) {
      case MediaType.image:
        return Image.memory(
          mediaItem.data.toImage(),
          fit: BoxFit.fitHeight,
        );
      case MediaType.video:
        final controller = controllers[index];
        late YoutubePlayer player;

        player = YoutubePlayer(
          key: ObjectKey(controller),
          controller: controller,
          bottomActions: [
            const SizedBox(width: 14.0),
            CurrentPosition(),
            const SizedBox(width: 8.0),
            ProgressBar(
              isExpanded: true,
              colors: const ProgressBarColors(
                backgroundColor: primaryColor,
                handleColor: accentColor,
                playedColor: accentColor,
              ),
            ),
            RemainingDuration(),
            const PlaybackSpeedButton(),
            IconButton(
              icon: Icon(
                controller.value.isFullScreen
                    ? Icons.fullscreen_exit
                    : Icons.fullscreen,
                color: Colors.white,
              ),
              onPressed: () {
                if (!controller.value.isFullScreen) {
                  onChangeCurrentPlayer(player);
                }
                controller.toggleFullScreenMode();
              },
            ),
          ],
        );

        return Padding(
          padding: EdgeInsets.only(bottom: clipRadius),
          child: player,
        );
    }
  }

  @override
  double get maxExtent => expandedHeight + clipRadius;

  @override
  double get minExtent => minExpandedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _ProductAppBarClipper extends CustomClipper<Path> {
  final double bottomRadius;

  _ProductAppBarClipper({this.bottomRadius = 10.0});

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
    return (oldClipper as _ProductAppBarClipper).bottomRadius != bottomRadius;
  }
}

class _ProductPageView extends StatefulWidget {
  final double height;
  final double clipRadius;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const _ProductPageView({
    Key? key,
    required this.height,
    required this.itemBuilder,
    required this.itemCount,
    required this.clipRadius,
  }) : super(key: key);

  @override
  _ProductPageViewState createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<_ProductPageView> {
  final _carouselController = CarouselController();
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider.builder(
        itemCount: widget.itemCount,
        itemBuilder: (context, index, realIndex) =>
            widget.itemBuilder(context, index),
        carouselController: _carouselController,
        options: CarouselOptions(
          height: widget.height,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          enlargeCenterPage: false,
          autoPlay: false,
          onPageChanged: (index, reason) {
            setState(() => _activeIndex = index);
          },
        ),
      ),
      Positioned(
        bottom: widget.clipRadius + 8,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: AnimatedSmoothIndicator(
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
        ),
      ),
    ]);
  }
}

class _ProductTabBar extends StatefulWidget {
  final Product product;
  final void Function(BuildContext context, CompactProduct product)
      onProductClick;
  final void Function(BuildContext context, Bundle bundle) onBundleProductClick;
  final void Function(BuildContext context, Bundle bundle) onBundleDesiredClick;

  const _ProductTabBar({
    Key? key,
    required this.product,
    required this.onProductClick,
    required this.onBundleProductClick,
    required this.onBundleDesiredClick,
  }) : super(key: key);

  @override
  _ProductTabBarState createState() => _ProductTabBarState();
}

class _ProductTabBarState extends State<_ProductTabBar>
    with SingleTickerProviderStateMixin {
  static const _tabs = [
    'Information',
    'DLC and Bundles',
    'System Requirements',
    'Reviews',
  ];

  late TabController _controller;

  bool _moreDescription = false;
  late Map<ProductReview, bool> _moreReviewDescription;

  void _onMoreReviewDescription(ProductReview productReview) {
    setState(() {
      _moreReviewDescription[productReview] =
          !_moreReviewDescription[productReview]!;
    });
  }

  @override
  void initState() {
    _controller = TabController(length: _tabs.length, vsync: this);
    _controller.addListener(() {
      if (_controller.indexIsChanging) {
        setState(() {});
      }
    });

    _moreReviewDescription = Map.fromEntries(widget.product.productReview
        .map((productReview) => MapEntry(productReview, false)));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TabBar(
        controller: _controller,
        isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        labelStyle: GoogleFonts.roboto(fontSize: 16),
        labelColor: accentColor,
        unselectedLabelColor: Colors.white70,
        indicatorColor: accentColor,
        tabs: _tabs
            .map((tabName) => Tab(
                  text: tabName,
                  height: 32,
                ))
            .toList(),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: 10, bottom: MediaQuery.of(context).padding.bottom),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: IndexedStack(
            key: ValueKey(_controller.index),
            index: _controller.index,
            children: [
              _buildInformation(context),
              _buildDLCAndBundles(context),
              _buildSystemRequirements(context),
              _buildReviews(context),
            ],
          ),
        ),
      ),
    ]);
  }

  //Informations
  Widget _buildInformation(BuildContext context) {
    return Column(children: [
      CategoryList(
        title: Text(
          'Description',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w700,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        child: _buildInformationDescription(context),
      ),
      CategoryList(
        title: Text(
          'Localization',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w700,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        child: _buildInformationLocalization(context),
      ),
      CategoryList(
        title: Text(
          'Other Informations',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w700,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        child: _buildInformationOther(context),
      ),
      CategoryList(
        title: Text(
          'Links',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w700,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        child: _buildInformationLinks(context),
      ),
    ]);
  }

  Widget _buildInformationDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: _buildDescription(
        context,
        description: widget.product.description,
        maxLines: 5,
        fontSize: 16,
        selected: _moreDescription,
        onMoreClick: () => setState(() {
          _moreDescription = !_moreDescription;
        }),
      ),
    );
  }

  Widget _buildInformationLocalization(BuildContext context) {
    final defaultTextStyle = GoogleFonts.roboto(fontSize: 14);

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            Text('Language', style: defaultTextStyle),
            ...['Sound', 'Interface', 'Subtitles'].map(
              (title) => Center(child: Text(title, style: defaultTextStyle)),
            ),
          ]),
          ...widget.product.localization.map((loc) {
            return TableRow(children: [
              Text(loc.language, style: defaultTextStyle),
              ...[loc.enabledSound, loc.enabledInterface, loc.enabledSubtitles]
                  .map((enabled) => Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            enabled
                                ? Icons.check_circle_outline
                                : Icons.cancel_outlined,
                            color: enabled ? Colors.green : Colors.grey,
                          ),
                        ),
                      )),
            ]);
          }),
        ],
      ),
    );
  }

  Widget _buildInformationOther(BuildContext context) {
    final informations = {
      'Developer': widget.product.developer,
      'Publisher': widget.product.publisher,
      'Release date': ui_utils.releaseDateToString(widget.product.releaseDate),
    };

    return Column(
      children: informations.entries
          .map((info) {
            return Row(children: [
              Text(
                "${info.key}:",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                info.value,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ]);
          })
          .expand((element) => [element, const SizedBox(height: 2)])
          .toList(),
    );
  }

  Widget _buildInformationLinks(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: widget.product.links
            .map((link) => TextButton(
                  onPressed: () async {
                    var url = Uri.parse(link.url);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  child: Text(link.title),
                ))
            .expand((element) => [element, const SizedBox(width: 8)])
            .toList(),
      ),
    );
  }

  //DLC and Bundles
  Widget _buildDLCAndBundles(BuildContext context) {
    return Column(children: [
      CategoryList(
        title: Text(
          'DLC',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w700,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        child: _buildDLC(context),
      ),
      const SizedBox(height: 10),
      CategoryList(
        title: Text(
          'Bundles',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w700,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        child: _buildBundles(context),
      ),
    ]);
  }

  Widget _buildDLC(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
          children: widget.product.productDlc
              .map((dlc) => _buildDLCItem(context, dlc: dlc))
              .expand((element) => [element, const SizedBox(height: 4)])
              .toList()),
    );
  }

  Widget _buildDLCItem(
    BuildContext context, {
    required ProductDLC dlc,
  }) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dlc.title,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 4),
          PriceWidget(
            price: dlc.price,
            fontSize: 14,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      onTap: () {},
    );
  }

  Widget _buildBundles(BuildContext context) {
    return Column(
      children: widget.product.bundles
          .map(
            (bundle) => CategoryList(
              title: Text(
                bundle.title,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: bundle.products
                          .map((product) => _buildBundleProduct(
                                context,
                                width: MediaQuery.of(context).size.width / 2,
                                product: product,
                              ))
                          .expand(
                              (element) => [element, const SizedBox(width: 10)])
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PriceWidget(
                          price: bundle.price,
                          fontSize: 12,
                          textDirection: TextDirection.rtl,
                          spacing: 4,
                        ),
                        const SizedBox(width: 8),
                        _buildBundleAddToProduct(
                          context,
                          onProductClick: () =>
                              widget.onBundleProductClick(context, bundle),
                          onDesiredClick: () =>
                              widget.onBundleDesiredClick(context, bundle),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .expand((element) => [
                element,
                const SizedBox(height: 4),
                const GradientDevider(),
              ])
          .take(widget.product.bundles.isNotEmpty
              ? widget.product.bundles.length * 2 - 1
              : 0)
          .toList(),
    );
  }

  Widget _buildBundleProduct(
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
                  onTap: () => widget.onProductClick(context, product),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ),
        ],
      ),
    );
  }

  Widget _buildBundleAddToProduct(
    BuildContext context, {
    required void Function() onProductClick,
    required void Function() onDesiredClick,
  }) {
    return Row(children: [
      SizedBox(
        height: 36,
        child: TextButton(
          onPressed: onProductClick,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            ),
          ),
          child: const Text(
            'Add to Product',
          ),
        ),
      ),
      const SizedBox(width: 4),
      SizedBox(
        height: 36,
        child: AspectRatio(
          aspectRatio: 1,
          child: Tooltip(
            message: 'Add to Desired',
            child: TextButton(
              onPressed: onDesiredClick,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              ),
              child: const Icon(Icons.bookmark_outline, size: 20),
            ),
          ),
        ),
      ),
    ]);
  }

  //System Requirements
  Widget _buildSystemRequirements(BuildContext context) {
    final systemRequirements = {
      'Minimum requirements': widget.product.systemRequirement
          .where((sysReq) => sysReq.type == SystemRequirementType.minimum)
          .toList(),
      'Recommended requirements': widget.product.systemRequirement
          .where((sysReq) => sysReq.type == SystemRequirementType.recommended)
          .toList(),
    };

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
          children: systemRequirements.entries
              .map((e) => CategoryList(
                    title: Text(
                      e.key,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    child: Column(
                        children: e.value
                            .map((sysReq) => _buildSystemRequirement(context,
                                sysReq: sysReq))
                            .toList()),
                  ))
              .expand((element) => [element, const SizedBox(height: 10)])
              .toList()),
    );
  }

  Widget _buildSystemRequirement(
    BuildContext context, {
    required SystemRequirement sysReq,
  }) {
    return CategoryList(
        title: Text(
          ui_utils.platformToName(sysReq.platform),
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sysReq.params.map((param) {
              var paramAndValue = param.split(": ");

              return paramAndValue.length > 1
                  ? RichText(
                      text: TextSpan(
                          text: '${paramAndValue[0]}: ',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                          children: [
                            TextSpan(
                              text: paramAndValue[1],
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    )
                  : Text(
                      param,
                      style: GoogleFonts.roboto(
                        color: Colors.white70,
                      ),
                    );
            }).toList(),
          ),
        ));
  }

  //Reviews
  Widget _buildReviews(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: widget.product.productReview
            .map((productReview) =>
                _buildReview(context, productReview: productReview))
            .expand((element) => [element, const SizedBox(height: 10)])
            .toList(),
      ),
    );
  }

  Widget _buildReview(
    BuildContext context, {
    required ProductReview productReview,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                      colors: [gradientStartColor, gradientStopColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: Image.memory(
                          productReview.user.avatar.data.toImage(),
                        ).image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productReview.user.nickname,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: productReview.rating.floor().toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 14,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        productReview.rating.toString(),
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              _buildDescription(
                context,
                description: productReview.description,
                maxLines: 2,
                fontSize: 14,
                selected: _moreReviewDescription[productReview]!,
                onMoreClick: () => _onMoreReviewDescription(productReview),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(
    BuildContext context, {
    required String description,
    required int maxLines,
    required double fontSize,
    required bool selected,
    required void Function() onMoreClick,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Text(
            description,
            maxLines: selected ? 1000 : maxLines,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              fontSize: fontSize,
              color: Colors.white70,
            ),
          ),
        ),
        const SizedBox(height: 4),
        IntrinsicWidth(
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: onMoreClick,
            child: Row(children: [
              Text(
                selected ? "" : "More",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                selected ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
