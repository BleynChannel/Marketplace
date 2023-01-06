import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/desired.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/presentation/bloc/desired/desired_bloc.dart';
import 'package:marketplace/presentation/bloc/desired/desired_event.dart';
import 'package:marketplace/presentation/bloc/desired/desired_state.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/price_widget.dart';
import 'package:shimmer/shimmer.dart';

class _DesiredAppBarAction {
  final String tooltip;
  final IconData icon;
  final void Function() onPressed;
  final bool Function() getActive;

  _DesiredAppBarAction({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
    required this.getActive,
  });
}

class DesiredPage extends StatefulWidget {
  const DesiredPage({Key? key}) : super(key: key);

  @override
  _DesiredPageState createState() => _DesiredPageState();
}

class _DesiredPageState extends State<DesiredPage> {
  static const int _shimerProductCount = 3;

  late DesiredBloc bloc;

  late List<_DesiredAppBarAction> _actions;

  List<Desired> _checkedDesired = [];

  void _onAllUnselected() {
    setState(() {
      _checkedDesired.clear();
    });
  }

  void _onAllSelected() {
    setState(() {
      _checkedDesired = [...debugDesiredList];
    });
  }

  void _onDelete() {
    setState(() {
      debugDesiredList
          .removeWhere((desired) => _checkedDesired.contains(desired));
      _checkedDesired.clear();
    });
  }

  void _onDesiredCheck(Desired desired, bool value) {
    setState(() {
      if (value) {
        _checkedDesired.add(desired);
      } else {
        _checkedDesired.remove(desired);
      }
    });
  }

  void _onRefreshPage(BuildContext context) {
    bloc.add(const DesiredEvent.onLoaded());
  }

  void _onProductClick(BuildContext context, Desired desired) {
    context.router.push(ProductRoute(compactProduct: desired.product));
  }

  _DesiredPageState() {
    _actions = [
      _DesiredAppBarAction(
        tooltip: 'Unselected all',
        icon: Icons.block,
        onPressed: _onAllUnselected,
        getActive: () => _checkedDesired.isNotEmpty,
      ),
      _DesiredAppBarAction(
        tooltip: 'Selected all',
        icon: Icons.check,
        onPressed: _onAllSelected,
        getActive: () => !listEquals(_checkedDesired, debugDesiredList),
      ),
      _DesiredAppBarAction(
        tooltip: 'Delete selects',
        icon: Icons.delete,
        onPressed: _onDelete,
        getActive: () => _checkedDesired.isNotEmpty,
      ),
    ];
  }

  @override
  void initState() {
    bloc = DesiredBloc()..add(const DesiredEvent.onLoaded());

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesiredBloc, DesiredState>(
      bloc: bloc,
      builder: (context, state) {
        return state.when<Widget>(
          load: () => _buildMain(context, desiredsList: null),
          loading: (desireds) => _buildMain(context, desiredsList: desireds),
          error: (message) => _buildError(context, message: message),
          noNetwork: () => _buildError(context, message: 'No network'),
        );
      },
    );
  }

  Widget _buildError(BuildContext context, {required String message}) {
    return Scaffold(
      body: BackgroundBlur(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              TextButton(
                onPressed: () => _onRefreshPage(context),
                child: const Text("Press to refresh page"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMain(BuildContext context,
      {required List<Desired>? desiredsList}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Desired",
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: _actions
            .map(
              (action) => IconButton(
                onPressed: action.getActive() ? action.onPressed : null,
                icon: Icon(action.icon),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                constraints: const BoxConstraints(),
                tooltip: action.tooltip,
              ),
            )
            .toList(),
      ),
      body: BackgroundBlur(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...(desiredsList ??
                              List<Desired?>.generate(
                                  _shimerProductCount, (index) => null))
                          .map((desired) => _buildDesiredItem(context, desired))
                          .expand((element) =>
                              [element, const SizedBox(height: 8)]),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesiredItem(BuildContext context, Desired? desired) {
    return IntrinsicHeight(
      child: Row(children: [
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: desired != null
                ? Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: Image.memory(
                            desired.product.banner.data.toImage(),
                          ).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => _onProductClick(context, desired),
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
              desired != null
                  ? Text(
                      desired.product.title,
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
              desired != null
                  ? SizedBox(
                      width: double.infinity,
                      height: 16,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          const iconSize = 16.0;
                          const spacing = 4.0;

                          final fullSizePlatformIcons =
                              desired.product.platforms.length *
                                      (iconSize + spacing) +
                                  spacing;

                          int fitPlatformCount = 0;
                          List<Platform> visiblePlatforms = [
                            ...desired.product.platforms
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
              desired != null
                  ? IntrinsicHeight(
                      child: PriceWidget(
                          price: desired.product.price, fontSize: 14),
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
        const SizedBox(width: 4),
        desired != null
            ? Checkbox(
                value: _checkedDesired.contains(desired),
                onChanged: (value) {
                  if (value != null) {
                    _onDesiredCheck(desired, value);
                  }
                },
              )
            : const SizedBox(),
      ]),
    );
  }
}
