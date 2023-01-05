import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/filter.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/presentation/bloc/search/search_bloc.dart';
import 'package:marketplace/presentation/bloc/search/search_event.dart';
import 'package:marketplace/presentation/bloc/search/search_state.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/price_widget.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  static const int _shimerProductCount = 3;

  final Filter _filter = Filter();

  void _onSearchChanged(BuildContext context, String value) {
    _filter.title = value;
    context.read<SearchBloc>().add(SearchEvent.onLoaded(_filter));
  }

  void _onFilterClick(BuildContext context) async {
    await context.router.push(FilterRoute(filter: _filter));
    // ignore: use_build_context_synchronously
    context.read<SearchBloc>().add(SearchEvent.onLoaded(_filter));
  }

  void _onProductClick(BuildContext context, CompactProduct product) {
    context.router.push(ProductRoute(compactProduct: product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundBlur(
        child: BlocProvider<SearchBloc>(
          create: (context) => SearchBloc()..add(SearchEvent.onLoaded(_filter)),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return state.when<Widget>(
                load: () => _buildMain(context, filterProducts: null),
                loading: (filterProducts) =>
                    _buildMain(context, filterProducts: filterProducts),
                error: (message) => _buildError(context, message: message),
                noNetwork: () => _buildError(context, message: 'No network'),
              );
            },
          ),
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
      {required List<CompactProduct>? filterProducts}) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          _buildTitleSearch(context),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ...(filterProducts ??
                        List<CompactProduct?>.generate(
                            _shimerProductCount, (index) => null))
                    .map((product) => _buildProductItem(context, product))
                    .expand((element) => [element, const SizedBox(height: 8)]),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ]),
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
          onChanged: (value) => _onSearchChanged(context, value),
        ),
      ),
      IconButton(
        onPressed: () => _onFilterClick(context),
        icon: const Icon(Icons.filter_alt_outlined),
        tooltip: 'Filter',
      )
    ]);
  }

  Widget _buildProductItem(BuildContext context, CompactProduct? product) {
    return IntrinsicHeight(
      child: Row(children: [
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: product != null
                ? Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: Image.memory(
                            product.banner.data.toImage(),
                          ).image,
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
                  ])
                : Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              product != null
                  ? Text(
                      product.title,
                      style: GoogleFonts.roboto(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
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
                    ),
              const SizedBox(height: 2),
              product != null
                  ? SizedBox(
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
                          List<Platform> visiblePlatforms = [
                            ...product.platforms
                          ];

                          if (constraints.maxWidth < fullSizePlatformIcons) {
                            double fitPlatformSize =
                                fullSizePlatformIcons - constraints.maxWidth;
                            fitPlatformCount =
                                (fitPlatformSize / (iconSize + spacing))
                                        .ceil() +
                                    1;
                            visiblePlatforms.removeRange(
                                visiblePlatforms.length - fitPlatformCount,
                                visiblePlatforms.length);
                          }

                          return Row(
                            children: [
                              ...visiblePlatforms
                                  .map((platform) => Tooltip(
                                        message:
                                            ui_utils.platformToName(platform),
                                        child: FaIcon(
                                          ui_utils.platformToIcon(platform),
                                          size: iconSize,
                                        ),
                                      ))
                                  .expand((element) => [
                                        element,
                                        const SizedBox(width: spacing)
                                      ]),
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
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
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
                    ),
              const SizedBox(height: 2),
              product != null
                  ? IntrinsicHeight(
                      child: PriceWidget(price: product.price, fontSize: 14),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
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
                    ),
            ],
          ),
        ),
      ]),
    );
  }
}
