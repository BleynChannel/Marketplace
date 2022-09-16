import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/desired.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/debugData.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/background_blur.dart';

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

  void _onProductClick(BuildContext context, Desired desired) {}

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
  Widget build(BuildContext context) {
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
                  child: ListView(children: [
                    ...debugDesiredList
                        .map((desired) => _buildDesiredItem(context, desired))
                        .expand(
                            (element) => [element, const SizedBox(height: 8)]),
                    const SizedBox(height: 20),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesiredItem(BuildContext context, Desired desired) {
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
                    image: Image.asset(desired.product.pathToImage).image,
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
                desired.product.title,
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
                        desired.product.platforms.length *
                                (iconSize + spacing) +
                            spacing;

                    int fitPlatformCount = 0;
                    List<String> visiblePlatforms = [
                      ...desired.product.platforms
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
                      "${desired.product.price.ceil()} ₽",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 2),
                    desired.product.oldPrice > 0
                        ? Text(
                            "${desired.product.oldPrice.ceil()} ₽",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(width: 2),
                    desired.product.discount != 0
                        ? Text(
                            "${(desired.product.discount * 100).ceil()}%",
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
        const SizedBox(width: 4),
        Checkbox(
          value: _checkedDesired.contains(desired),
          onChanged: (value) {
            if (value != null) {
              _onDesiredCheck(desired, value);
            }
          },
        ),
      ]),
    );
  }
}
