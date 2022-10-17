import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/cart_product.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/presentation/bloc/cart/cart_bloc.dart';
import 'package:marketplace/presentation/bloc/cart/cart_event.dart';
import 'package:marketplace/presentation/bloc/cart/cart_state.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;
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

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  static const int _shimerProductCount = 6;

  late CartBloc bloc;

  late List<CartProduct> _checkedProduct;
  List<CartProduct>? _cartProductList;

  double _allPrice = 0.0;
  double _allOldPrice = 0.0;

  void _changePrice() {
    _allPrice = _checkedProduct.fold(
        0.0, (sum, cartProduct) => sum + cartProduct.product.price.price);
    _allOldPrice = _checkedProduct.fold(
        0.0,
        (sum, cartProduct) =>
            sum +
            (cartProduct.product.price.oldPrice > 0
                ? cartProduct.product.price.oldPrice
                : cartProduct.product.price.price));
  }

  void _onAllUnselected() {
    setState(() {
      _checkedProduct.clear();
      _changePrice();
    });
  }

  void _onAllSelected() {
    setState(() {
      _checkedProduct = [...(_cartProductList ?? [])];
      _changePrice();
    });
  }

  void _onDelete() {
    setState(() {
      //TODO: Вызвать событие удаления продукта

      _cartProductList
          ?.removeWhere((product) => _checkedProduct.contains(product));

      _checkedProduct.clear();
      _changePrice();
    });
  }

  void _onProductCheck(CartProduct product, bool value) {
    setState(() {
      if (value) {
        _checkedProduct.add(product);
      } else {
        _checkedProduct.remove(product);
      }

      _changePrice();
    });
  }

  void _onProductClick(BuildContext context, CartProduct cartProduct) {
    context.router.push(ProductRoute(compactProduct: cartProduct.product));
  }

  void _onCheckout() {}

  @override
  void initState() {
    _checkedProduct = [];

    bloc = CartBloc()..add(const CartEvent.onLoaded());

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      bloc: bloc,
      builder: (context, state) {
        return state.when<Widget>(
          load: () => _buildMain(context, products: null),
          loading: (products) => _buildMain(context, products: products),
          error: () => _buildError(context, message: 'Error loading products'),
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

  Widget _buildMain(BuildContext context,
      {required List<CartProduct>? products}) {
    if (_cartProductList == null && products != null) {
      _cartProductList = [...products];
    }

    List<_CartAppBarAction> actions = [
      _CartAppBarAction(
        tooltip: 'Unselected all',
        icon: Icons.block,
        onPressed: _onAllUnselected,
        getActive: () => _checkedProduct.isNotEmpty,
      ),
      _CartAppBarAction(
        tooltip: 'Selected all',
        icon: Icons.check,
        onPressed: () => _onAllSelected(),
        getActive: () =>
            _checkedProduct.length !=
            (_cartProductList?.length ?? _checkedProduct.length),
      ),
      _CartAppBarAction(
        tooltip: 'Delete selects',
        icon: Icons.delete,
        onPressed: () => _onDelete(),
        getActive: () => _checkedProduct.isNotEmpty,
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
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        _buildProductItem(context, _cartProductList?[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: _cartProductList?.length ?? _shimerProductCount,
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
                        Text(
                          "$_allPrice ₽",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        _allOldPrice != 0 && _allOldPrice != _allPrice
                            ? Text(
                                "$_allOldPrice ₽",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextButton(
                        onPressed: _checkedProduct.isEmpty ? null : _onCheckout,
                        child: const Text("Checkout"),
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

  Widget _buildProductItem(BuildContext context, CartProduct? cartProduct) {
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
                        onTap: () => _onProductClick(context, cartProduct),
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
            ? Checkbox(
                value: _checkedProduct.contains(cartProduct),
                onChanged: (value) {
                  if (value != null) {
                    _onProductCheck(cartProduct, value);
                  }
                },
              )
            : const SizedBox(),
      ]),
    );
  }
}
