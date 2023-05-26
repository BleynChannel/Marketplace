import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/desired.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/presentation/bloc/desired/desired_bloc.dart';
import 'package:marketplace/presentation/bloc/desired/desired_state.dart';
import 'package:marketplace/core/const/colors.dart';
import 'package:marketplace/presentation/controller/desired_controller.dart';
import 'package:marketplace/core/utils/utils.dart';
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

@RoutePage()
class DesiredPage extends StatelessWidget {
  const DesiredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DesiredController();

    final actions = [
      _DesiredAppBarAction(
        tooltip: 'unselectTooltip'.tr,
        icon: Icons.block,
        onPressed: controller.onAllUnselected,
        getActive: () => controller.checkedDesired.isNotEmpty,
      ),
      _DesiredAppBarAction(
        tooltip: 'selectTooltip'.tr,
        icon: Icons.check,
        onPressed: controller.onAllSelected,
        getActive: () =>
            controller.checkedDesired.length !=
            controller.desiredProductList.length,
      ),
      _DesiredAppBarAction(
        tooltip: 'deleteTooltip'.tr,
        icon: Icons.delete,
        onPressed: controller.onDeleteSelected,
        getActive: () => controller.checkedDesired.isNotEmpty,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'desired'.tr,
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
        actions: actions
            .map(
              (action) => Obx(
                () => IconButton(
                  onPressed: action.getActive() ? action.onPressed : null,
                  icon: Icon(action.icon),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  constraints: const BoxConstraints(),
                  tooltip: action.tooltip,
                ),
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
                  child: BlocConsumer<DesiredBloc, DesiredState>(
                    bloc: controller.bloc,
                    listener: (context, state) => state.whenOrNull(
                      loading: (desireds) =>
                          controller.desiredProductList = [...desireds],
                    ),
                    builder: (context, state) {
                      return state.when<Widget>(
                        load: () =>
                            _buildMain(context, controller, hasProducts: false),
                        loading: (desireds) =>
                            _buildMain(context, controller, hasProducts: true),
                        error: (message) =>
                            _buildError(context, controller, message: message),
                        noNetwork: () => _buildError(context, controller,
                            message: 'noInternet'.tr),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildError(
    BuildContext context,
    DesiredController controller, {
    required String message,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () => controller.onRefreshPage(),
            child: Text('refreshPage'.tr),
          ),
        ],
      ),
    );
  }

  Widget _buildMain(
    BuildContext context,
    DesiredController controller, {
    required bool hasProducts,
  }) {
    if (hasProducts) {
      return Obx(
        () => _buildDesiredList(
          context,
          controller,
          desiredProductList: controller.desiredProductList,
          itemCount: controller.desiredProductList.length,
        ),
      );
    }

    return _buildDesiredList(
      context,
      controller,
      desiredProductList: null,
      itemCount: DesiredController.shimerProductCount,
    );
  }

  Widget _buildDesiredList(
    BuildContext context,
    DesiredController controller, {
    required List<Desired>? desiredProductList,
    required int itemCount,
  }) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => _buildDesiredItem(
        context,
        controller,
        desired: desiredProductList?[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: itemCount,
    );
  }

  Widget _buildDesiredItem(
    BuildContext context,
    DesiredController controller, {
    required Desired? desired,
  }) {
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
                          image: (desired.product.banner != null
                                  ? Image.memory(
                                      desired.product.banner!.toImage()!)
                                  : Image.asset('assets/images/no-image.png'))
                              .image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () =>
                            controller.onProductClick(context, desired),
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
                                        message: Utils.platformToName(platform),
                                        child: FaIcon(
                                          Utils.platformToIcon(platform),
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
                                          color: AppColors.accentColor,
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
            ? Obx(
                () => Checkbox(
                  value: controller.checkedDesired.contains(desired),
                  onChanged: (value) {
                    if (value != null) {
                      controller.onDesiredCheck(desired, value);
                    }
                  },
                ),
              )
            : const SizedBox(),
      ]),
    );
  }
}
