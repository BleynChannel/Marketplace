import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/cart_product.dart';
import 'package:marketplace/domain/entity/product.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/utils/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/gradient_devider.dart';

class _CartAppBarAction {
  final String tooltip;
  final IconData icon;
  final void Function() onPressed;

  _CartAppBarAction({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });
}

class CartPage extends StatefulWidget {
  final _debugProduct = [
    CartProduct(
      product: Product(
        title: 'Cyberpunk 2077',
        pathToImage: 'assets/images/cyberpunk.jpg',
        price: 999,
        oldPrice: 1999,
        discount: 0.5,
        platforms: ['Windows', 'Linux', 'MacOS'],
      ),
      count: 1,
    ),
    CartProduct(
      product: Product(
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
      count: 1,
    ),
    CartProduct(
      product: Product(
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
      count: 1,
    ),
  ];

  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<_CartAppBarAction> _actions;

  List<CartProduct> _checkedProduct = [];

  double _allPrice = 0.0;
  double _allOldPrice = 0.0;

  void _changePrice() {
    _allPrice = _checkedProduct.fold(
        0.0, (sum, cartProduct) => sum + cartProduct.product.price);
    _allOldPrice = _checkedProduct.fold(
        0.0,
        (sum, cartProduct) =>
            sum +
            (cartProduct.product.price == cartProduct.product.oldPrice
                ? 0
                : cartProduct.product.oldPrice));
  }

  void _onAllUnchecked() {
    setState(() {
      _checkedProduct.clear();
      _changePrice();
    });
  }

  void _onAllChecked() {
    setState(() {
      _checkedProduct = [...widget._debugProduct];
      _changePrice();
    });
  }

  void _onDelete() {
    setState(() {
      widget._debugProduct
          .removeWhere((product) => _checkedProduct.contains(product));
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

  void _onCheckout() {}

  _CartPageState() {
    _actions = [
      _CartAppBarAction(
        tooltip: 'Unselected all',
        icon: Icons.block,
        onPressed: _onAllUnchecked,
      ),
      _CartAppBarAction(
        tooltip: 'Selected all',
        icon: Icons.check,
        onPressed: _onAllChecked,
      ),
      _CartAppBarAction(
        tooltip: 'Delete selects',
        icon: Icons.delete,
        onPressed: _onDelete,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: _actions
            .map(
              (action) => IconButton(
                onPressed: action.onPressed,
                icon: Icon(action.icon),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                constraints: const BoxConstraints(),
                // TODO: Добавить всем нуждающимся виджетам tooltip
                // tooltip: action.tooltip,
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
                    itemBuilder: (context, index) =>
                        _buildProductItem(context, widget._debugProduct[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: widget._debugProduct.length,
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
                        _allOldPrice != 0
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

  Widget _buildProductItem(BuildContext context, CartProduct cartProduct) {
    return IntrinsicHeight(
      child: Row(children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 10,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image:
                            Image.asset(cartProduct.product.pathToImage).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                    ),
                  ),
                ]),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartProduct.product.title,
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
                        cartProduct.product.platforms.length *
                                (iconSize + spacing) +
                            spacing;

                    int fitPlatformCount = 0;
                    List<String> visiblePlatforms = [
                      ...cartProduct.product.platforms
                    ];

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
                                  message: platform,
                                  child: FaIcon(
                                    ui_utils.getPlatformIcon(platform),
                                    size: iconSize,
                                  ),
                                ))
                            .toList()
                            .expand((element) =>
                                [element, const SizedBox(width: spacing)])
                            .toList(),
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
                      "${cartProduct.product.price.ceil()} ₽",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 2),
                    cartProduct.product.price != cartProduct.product.oldPrice
                        ? Text(
                            "${cartProduct.product.oldPrice.ceil()} ₽",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(width: 2),
                    cartProduct.product.discount != 0
                        ? Text(
                            "${(cartProduct.product.discount * 100).ceil()}%",
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
              Text(
                "${cartProduct.count} piece",
                style: GoogleFonts.roboto(fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(width: 4),
        Checkbox(
          value: _checkedProduct.contains(cartProduct),
          onChanged: (value) {
            if (value != null) {
              _onProductCheck(cartProduct, value);
            }
          },
        ),
      ]),
    );
  }
}
