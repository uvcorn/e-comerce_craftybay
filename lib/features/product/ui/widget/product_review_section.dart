import 'package:crafty/app/app_colors.dart';
import 'package:crafty/features/review/ui/screen/review_screen_raw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewSection extends StatelessWidget {
  const ProductReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, size: 18, color: Colors.amber),
        const SizedBox(width: 4),
        const Text('4.5', style: TextStyle(color: Colors.grey)),
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
}
