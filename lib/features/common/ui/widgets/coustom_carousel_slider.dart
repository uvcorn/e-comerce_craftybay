import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty/app/app_colors.dart';
import 'package:flutter/material.dart';

enum SliderType { home, product }

class CustomCarouselSlider extends StatefulWidget {
  final SliderType type;
  final List<Widget>? productImages;
  final bool autoplay;

  const CustomCarouselSlider({
    super.key,
    required this.type,
    this.productImages,
    this.autoplay = true,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final ValueNotifier<int> _current = ValueNotifier(0);
  List<int> get _mockItems => [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    final isHome = widget.type == SliderType.home;
    final items = isHome
        ? _mockItems.map((i) => _buildHomeItem(context, i)).toList()
        : (widget.productImages ??
              _mockItems.map((i) => _buildProductItem(context, i)).toList());

    final slider = CarouselSlider(
      options: CarouselOptions(
        height: isHome ? 180 : 240,
        autoPlay: widget.autoplay,
        viewportFraction: 1,
        onPageChanged: (i, _) => _current.value = i,
      ),
      items: items,
    );

    final indicators = ValueListenableBuilder(
      valueListenable: _current,
      builder: (context, index, _) {
        final count = items.length;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (i) {
            return Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.only(left: isHome ? 2 : 3),
              decoration: BoxDecoration(
                border: isHome
                    ? Border.all(color: Colors.grey.shade400, width: 1)
                    : null,
                borderRadius: BorderRadius.circular(8),
                color: index == i
                    ? AppColors.themeColor
                    : isHome
                    ? null
                    : Colors.grey,
              ),
            );
          }),
        );
      },
    );

    if (isHome) {
      return Column(children: [slider, const SizedBox(height: 8), indicators]);
    } else {
      return Stack(
        children: [
          slider,
          Positioned(bottom: 8, left: 0, right: 0, child: indicators),
        ],
      );
    }
  }

  Widget _buildHomeItem(BuildContext context, int i) => Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 2),
    decoration: BoxDecoration(
      color: AppColors.themeColor,
      borderRadius: BorderRadius.circular(8),
    ),
    alignment: Alignment.center,
    child: Text('text $i', style: const TextStyle(fontSize: 16)),
  );

  Widget _buildProductItem(BuildContext context, int i) => Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 2),
    decoration: BoxDecoration(color: Colors.grey.shade300),
    alignment: Alignment.center,
    child: Text('Image $i', style: const TextStyle(fontSize: 16)),
  );
}
