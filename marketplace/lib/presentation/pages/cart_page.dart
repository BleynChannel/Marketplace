import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/cart_product.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/presentation/bloc/cart/cart_bloc.dart';
import 'package:marketplace/presentation/bloc/cart/cart_state.dart';
import 'package:marketplace/core/const/colors.dart';
import 'package:marketplace/core/utils/utils.dart';
import 'package:marketplace/presentation/controller/cart_controller.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';
import 'package:marketplace/presentation/widgets/price_widget.dart';
import 'package:shimmer/shimmer.dart';

class _CartAppBarAction {
  final String tooltip;
  final IconData icon;
  final void Function() onPressed;
  final bool Function() getActive;

  _CartAppBarAction({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
    required this.getActive,
  });
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController();

    final actions = [
      _CartAppBarAction(
        tooltip: 'Unselected all',
        icon: Icons.block,
        onPressed: controller.onAllUnselected,
        getActive: () => controller.checkedProduct.isNotEmpty,
      ),
      _CartAppBarAction(
        tooltip: 'Selected all',
        icon: Icons.check,
        onPressed: controller.onAllSelected,
        getActive: () =>
            controller.checkedProduct.length !=
            controller.cartProductList.length,
      ),
      _CartAppBarAction(
        tooltip: 'Delete selects',
        icon: Icons.delete,
        onPressed: controller.onDeleteSelected,
        getActive: () => controller.checkedProduct.isNotEmpty,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
                  child: BlocConsumer<CartBloc, CartState>(
                    bloc: controller.bloc,
                    listener: (context, state) => state.whenOrNull(
                      loading: (products) =>
                          controller.cartProductList = [...products],
                    ),
                    builder: (context, state) => state.when<Widget>(
                      load: () =>
                          _buildMain(context, controller, hasProducts: false),
                      loading: (_) =>
                          _buildMain(context, controller, hasProducts: true),
                      error: (message) =>
                          _buildError(context, controller, message: message),
                      noNetwork: () => _buildError(context, controller,
                          message: 'No network'),
                    ),
                  ),
                ),
                const GradientDevider(),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Total: ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Obx(
                          () => Text(
                            "${controller.allPrice} ₽",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Obx(() {
                          if (controller.allOldPrice == 0.0 ||
                              controller.allOldPrice == controller.allPrice) {
                            return const SizedBox();
                          }

                          return Text(
                            "${controller.allOldPrice} ₽",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: controller.checkedProduct.isEmpty
                              ? null
                              : () => controller.onCheckout(context),
                          child: const Text("Checkout"),
                        ),
                      ),
                    ),
                  ],
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
    CartController controller, {
    required String message,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () => controller.onRefreshPage(),
            child: const Text("Press to refresh page"),
          ),
        ],
      ),
    );
  }

  Widget _buildMain(
    BuildContext context,
    CartController controller, {
    required bool hasProducts,
  }) {
    if (hasProducts) {
      return Obx(
        () => _buildProductList(
          context,
          controller,
          cartProductList: controller.cartProductList,
          itemCount: controller.cartProductList.length,
        ),
      );
    }

    return _buildProductList(
      context,
      controller,
      cartProductList: null,
      itemCount: CartController.shimerProductCount,
    );
  }

  Widget _buildProductList(
    BuildContext context,
    CartController controller, {
    required List<CartProduct>? cartProductList,
    required int itemCount,
  }) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => _buildProductItem(
        context,
        controller,
        cartProduct: cartProductList?[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: itemCount,
    );
  }

  Widget _buildProductItem(
    BuildContext context,
    CartController controller, {
    required CartProduct? cartProduct,
  }) {
    return IntrinsicHeight(
      child: Row(children: [
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: cartProduct != null
                ? Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: Image.memory(
                            cartProduct.product.banner.data.toImage(),
                          ).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () =>
                            controller.onProductClick(context, cartProduct),
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
              cartProduct != null
                  ? Text(
                      cartProduct.product.title,
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
              cartProduct != null
                  ? SizedBox(
                      width: double.infinity,
                      height: 16,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          const iconSize = 16.0;
                          const spacing = 4.0;

                          final fullSizePlatformIcons =
                              cartProduct.product.platforms.length *
                                      (iconSize + spacing) +
                                  spacing;

                          int fitPlatformCount = 0;
                          List<Platform> visiblePlatforms = [
                            ...cartProduct.product.platforms
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
                                            Utils.platformToName(platform),
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
              cartProduct != null
                  ? IntrinsicHeight(
                      child: PriceWidget(
                        price: cartProduct.product.price,
                        fontSize: 14,
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
              cartProduct != null
                  ? Text(
                      "${cartProduct.count} piece",
                      style: GoogleFonts.roboto(fontSize: 14),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(width: 4),
        cartProduct != null
            ? Obx(
                () => Checkbox(
                  value: controller.checkedProduct.contains(cartProduct),
                  onChanged: (value) {
                    if (value != null) {
                      controller.onProductCheck(cartProduct, value);
                    }
                  },
                ),
              )
            : const SizedBox(),
      ]),
    );
  }
}
