import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageView extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final double? contentWidthFraction;

  const HomePageView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    required this.contentWidthFraction,
  }) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final _carouselController = CarouselController();
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: widget.itemCount,
              itemBuilder: (context, index, realIndex) =>
                  widget.itemBuilder(context, index),
              carouselController: _carouselController,
              options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (index, reason) =>
                    setState(() => _activeIndex = index),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        AnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          count: widget.itemCount,
          effect: const WormEffect(
            activeDotColor: accentColor,
            dotColor: Colors.white70,
            dotWidth: 16,
            dotHeight: 8,
          ),
          onDotClicked: (index) => setState(() {
            _activeIndex = index;
            _carouselController.animateToPage(index);
          }),
        ),
      ],
    );
  }
}
