import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/domain/entity/filter.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/core/const/colors.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/widgets/custom_range_slider.dart';
import 'package:marketplace/core/utils/utils.dart';
import 'package:marketplace/presentation/widgets/expansion_category.dart';

class FilterPage extends StatelessWidget {
  final Filter filter;

  const FilterPage({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> filterCategory = {
      'filterPrice'.tr: _buildCategoryPrice(context),
      'filterYearOfRelease'.tr: _buildCategoryYearOfRelease(context),
      'filterGenre'.tr: _buildCategoryGenre(context),
      'filterStylistics'.tr: _buildCategoryStylistics(context),
      'filterPlatforms'.tr: _buildCategoryPlatforms(context),
      'filterMultiplayer'.tr: _buildCategoryMultiplayer(context),
    };

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'filter'.tr,
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
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ...filterCategory.entries
              .map((category) => ExpansionCategory(
                    title: Text(
                      category.key,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    child: category.value,
                  ))
              .expand((element) => [element, const SizedBox(height: 10)]),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCategoryPrice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FilterRangeSlider(
        values: RangeValues(filter.minPrice, filter.maxPrice),
        constrainValue: const RangeValues(0, 100000),
        postfixText: '₽',
        onChanged: (value) {
          filter.minPrice = value.start;
          filter.maxPrice = value.end;
        },
      ),
    );
  }

  Widget _buildCategoryYearOfRelease(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FilterRangeSlider(
        values: RangeValues(filter.minYearOfRelease, filter.maxYearOfRelease),
        constrainValue: RangeValues(1967, DateTime.now().year.toDouble()),
        fixedDecimalField: 0,
        onChanged: (value) {
          filter.minYearOfRelease = value.start;
          filter.maxYearOfRelease = value.end;
        },
      ),
    );
  }

  Widget _buildCategoryGenre(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChips(
        //! Необходимо сравнивать с текущими фильтрами и закидовать список с выбранными элементами
        items: debugFilterGenre,
        selectedItems: filter.genre,
        onSelected: (selected) => filter.genre = selected,
      ),
    );
  }

  Widget _buildCategoryStylistics(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChips(
        items: debugFilterStylistics,
        selectedItems: filter.stylistics,
        onSelected: (selected) => filter.stylistics = selected,
      ),
    );
  }

  Widget _buildCategoryPlatforms(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChips(
        items: Platform.values.map((e) => Utils.platformToName(e)).toList(),
        selectedItems:
            filter.platforms.map((e) => Utils.platformToName(e)).toList(),
        onSelected: (selected) => filter.platforms =
            selected.map((e) => Utils.platformFromName(e)).toList(),
      ),
    );
  }

  Widget _buildCategoryMultiplayer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChips(
        items: debugFilterMultiplayer,
        selectedItems: filter.multiplayer,
        onSelected: (selected) => filter.multiplayer = selected,
      ),
    );
  }
}

class FilterRangeSlider extends StatefulWidget {
  final RangeValues values;
  final RangeValues constrainValue;
  final Function(RangeValues)? onChanged;
  final String? postfixText;
  final String? suffixText;
  final int fixedDecimalField;

  const FilterRangeSlider({
    Key? key,
    required this.values,
    required this.constrainValue,
    required this.onChanged,
    this.postfixText,
    this.suffixText,
    this.fixedDecimalField = 2,
  }) : super(key: key);

  @override
  _FilterRangeSliderState createState() => _FilterRangeSliderState();
}

class _FilterRangeSliderState extends State<FilterRangeSlider> {
  late RangeValues _values;

  late TextEditingController _minTextFieldController;
  late TextEditingController _maxTextFieldController;

  void _onSliderChanged(RangeValues values) {
    setState(() {
      _values = values;

      _minTextFieldController.text =
          _values.start.toStringAsFixed(widget.fixedDecimalField);
      _maxTextFieldController.text =
          _values.end.toStringAsFixed(widget.fixedDecimalField);
    });

    widget.onChanged!(_values);
  }

  @override
  void initState() {
    _values = widget.values;

    _minTextFieldController = TextEditingController(
      text: _values.start.toStringAsFixed(widget.fixedDecimalField),
    );
    _maxTextFieldController = TextEditingController(
      text: _values.end.toStringAsFixed(widget.fixedDecimalField),
    );

    _minTextFieldController.addListener(() {
      setState(() {
        _values = RangeValues(
          clampDouble(
            double.tryParse(_minTextFieldController.text) ?? 0.0,
            widget.constrainValue.start,
            _values.end,
          ),
          _values.end,
        );
      });

      widget.onChanged!(_values);
    });

    _maxTextFieldController.addListener(() {
      setState(() {
        _values = RangeValues(
          _values.start,
          clampDouble(
            double.tryParse(_maxTextFieldController.text) ?? 0.0,
            _values.start,
            widget.constrainValue.end,
          ),
        );
      });

      widget.onChanged!(_values);
    });

    super.initState();
  }

  @override
  void dispose() {
    _minTextFieldController.dispose();
    _maxTextFieldController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Expanded(child: SizedBox()),
            Expanded(
              flex: 8,
              child: CustomRangeSlider(
                values: _values,
                constrainValue: widget.constrainValue,
                postfixText: widget.postfixText,
                suffixText: widget.suffixText,
                onChanged: _onSliderChanged,
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
        Row(children: [
          Expanded(
            child: TextField(
              controller: _minTextFieldController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                NumericalRangeFormatter(max: widget.constrainValue.end),
              ],
              onEditingComplete: () {
                setState(() {
                  _minTextFieldController.text =
                      _values.start.toStringAsFixed(widget.fixedDecimalField);
                });
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _maxTextFieldController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.continueAction,
              inputFormatters: [
                NumericalRangeFormatter(max: widget.constrainValue.end),
              ],
              onEditingComplete: () {
                setState(() {
                  _maxTextFieldController.text =
                      _values.end.toStringAsFixed(widget.fixedDecimalField);
                });
              },
            ),
          ),
        ]),
      ],
    );
  }
}

class NumericalRangeFormatter extends TextInputFormatter {
  final double max;

  NumericalRangeFormatter({required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return newValue;
    } else {
      return (double.tryParse(newValue.text) ?? 0) > max ? oldValue : newValue;
    }
  }
}

class FilterChips extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;
  final void Function(List<String> selected) onSelected;

  const FilterChips({
    Key? key,
    required this.items,
    required this.selectedItems,
    required this.onSelected,
  }) : super(key: key);

  @override
  _FilterChipsState createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  late List<String> _filters;
  bool allSelected = true;

  @override
  void initState() {
    _filters = widget.selectedItems;
    allSelected = widget.selectedItems.isEmpty;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Wrap(spacing: 4, runSpacing: 4, children: [
        _buildPlatformItem(
          context,
          title: 'all'.tr,
          selected: allSelected || _filters.isEmpty,
          onSelected: (value) {
            setState(() {
              allSelected = value;

              if (value) {
                widget.onSelected(widget.items);
              } else {
                widget.onSelected(_filters);
              }
            });
          },
        ),
        ...widget.items.map((platform) {
          return _buildPlatformItem(
            context,
            title: platform,
            selected: !allSelected && _filters.contains(platform),
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  allSelected = false;

                  if (!_filters.contains(platform)) {
                    _filters.add(platform);
                  }
                } else {
                  _filters.removeWhere((element) => element == platform);
                }

                widget.onSelected(_filters);
              });
            },
          );
        }).toList()
      ]),
    );
  }

  Widget _buildPlatformItem(
    BuildContext context, {
    required String title,
    required bool selected,
    required void Function(bool) onSelected,
  }) {
    return FilterChip(
      label: Text(
        title,
        style: Theme.of(context).textTheme.caption?.copyWith(
              color: selected ? Colors.white : Colors.white70,
            ),
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primaryColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      backgroundColor: Colors.transparent,
      selectedColor: AppColors.primaryColor,
      showCheckmark: false,
      selected: selected,
      onSelected: onSelected,
    );
  }
}
