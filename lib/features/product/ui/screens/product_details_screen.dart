// ignore_for_file: deprecated_member_use

import 'package:crafty/app/app_colors.dart';
import 'package:crafty/app/constant.dart';
import 'package:crafty/features/product/ui/widget/color_picker.dart';
import 'package:crafty/features/product/ui/widget/inc_dec_button.dart';
import 'package:crafty/features/product/ui/widget/product_image_slider.dart';
import 'package:crafty/features/product/ui/widget/size_picker.dart';
import 'package:crafty/features/review/ui/screen/review_screen_raw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static final String name = '/product-details';
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitleAndQuantity(),
                        const SizedBox(height: 8),
                        _buildRatingAndActions(),
                        const SizedBox(height: 16),
                        _buildColorPicker(),
                        const SizedBox(height: 16),
                        _buildSizePicker(),
                        const SizedBox(height: 16),
                        _buildDescription(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(context),
        ],
      ),
    );
  }

  Widget _buildTitleAndQuantity() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Nike 1204HST - new shoe of 2025',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
              color: Colors.black87,
            ),
          ),
        ),
        IncDecButton(onChange: (int value) {}),
      ],
    );
  }

  Widget _buildRatingAndActions() {
    return Row(
      children: [
        Wrap(
          children: [
            const Icon(Icons.star, size: 18, color: Colors.amber),
            const SizedBox(width: 4),
            const Text('4.5', style: TextStyle(color: Colors.grey)),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.toNamed(ReviewScreen.name);
          },
          child: const Text('Reviews'),
        ),
        Card(
          color: AppColors.themeColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.all(2),
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColorPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        ColorPicker(
          colors: const ['Black', 'Blue', 'Pink', 'White', 'Yellow'],
          onSelected: (String value) {},
        ),
      ],
    );
  }

  Widget _buildSizePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        SizePicker(
          sizes: const ['S', 'M', 'L', 'XL', 'XXL'],
          onSelected: (String value) {},
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Description',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Text(
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.''',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: Theme.of(context).textTheme.bodyLarge),
              Text(
                "${Constant.takaSign}100",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add TO Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
