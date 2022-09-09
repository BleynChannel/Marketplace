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
    this.contentWidthFraction,
  }) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(
      viewportFraction: widget.contentWidthFraction ?? 0.8,
      initialPage: 1,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemBuilder: widget.itemBuilder,
            itemCount: widget.itemCount,
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: pageController!,
          count: widget.itemCount,
          effect: WormEffect(
            activeDotColor: accentColor,
            dotColor: Colors.white.withOpacity(0.8),
            dotWidth: 16,
            dotHeight: 8,
          ),
          onDotClicked: (index) {
            pageController?.animateToPage(index,
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut);
          },
        ),
      ],
    );
  }
}
