import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/filter.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Filter _filter;
  late List<CompactProduct> _filterList;

  void _onChangeFilterList() {
    _filterList = debugProductList
        .where((product) => ui_utils.isCorrectFilter(product, _filter))
        .map((product) => product.toCompactProduct())
        .toList();
  }

  void _onSearchChanged(String value) {
    setState(() {
      _filter.title = value;
      _onChangeFilterList();
    });
  }

  void _onFilterClick(BuildContext context) async {
    await context.router.push(FilterRoute(filter: _filter));

    setState(() {
      _onChangeFilterList();
    });
  }

  void _onProductClick(BuildContext context, CompactProduct product) {
    context.router.push(ProductRoute(product: product.toProduct()));
  }

  @override
  void initState() {
    _filter = Filter();
    _filterList = debugCompactProductList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundBlur(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              _buildTitleSearch(context),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: [
                    ..._filterList
                        .map((product) => _buildProductItem(context, product))
                        .expand(
                            (element) => [element, const SizedBox(height: 8)]),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSearch(BuildContext context) {
    return Row(children: [
      Expanded(
        child: TextField(
          decoration: const InputDecoration(
            hintText: "Search",
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          onChanged: _onSearchChanged,
        ),
      ),
      IconButton(
        onPressed: () => _onFilterClick(context),
        icon: const Icon(Icons.filter_alt_outlined),
      )
    ]);
  }

  Widget _buildProductItem(BuildContext context, CompactProduct product) {
    return IntrinsicHeight(
      child: Row(children: [
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: Image.asset(product.banner.path).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => _onProductClick(context, product),
                ),
              ),
            ]),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: GoogleFonts.roboto(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: double.infinity,
                height: 16,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const iconSize = 16.0;
                    const spacing = 4.0;

                    final fullSizePlatformIcons =
                        product.platforms.length * (iconSize + spacing) +
                            spacing;

                    int fitPlatformCount = 0;
                    List<Platform> visiblePlatforms = [...product.platforms];

                    if (constraints.maxWidth < fullSizePlatformIcons) {
                      double fitPlatformSize =
                          fullSizePlatformIcons - constraints.maxWidth;
                      fitPlatformCount =
                          (fitPlatformSize / (iconSize + spacing)).ceil() + 1;
                      visiblePlatforms.removeRange(
                          visiblePlatforms.length - fitPlatformCount,
                          visiblePlatforms.length);
                    }

                    return Row(
                      children: [
                        ...visiblePlatforms
                            .map((platform) => Tooltip(
                                  message: ui_utils.platformToName(platform),
                                  child: FaIcon(
                                    ui_utils.platformToIcon(platform),
                                    size: iconSize,
                                  ),
                                ))
                            .expand((element) =>
                                [element, const SizedBox(width: spacing)]),
                        constraints.maxWidth < fullSizePlatformIcons
                            ? Center(
                                child: Text(
                                  "+$fitPlatformCount",
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: accentColor,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 2),
              IntrinsicHeight(
                child: Row(
                  children: [
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
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
