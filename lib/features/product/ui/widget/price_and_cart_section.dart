import 'package:crafty/app/app_colors.dart';
import 'package:flutter/material.dart';

import 'add_to_cart_button.dart';

class PriceAndCartSection extends StatelessWidget {
  final String price;
  final VoidCallback onAddToCart;

  const PriceAndCartSection({
    super.key,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.themeColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey.shade200)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Price',
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: TextStyle(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(width: 150),
          AddToCartButton(onPressed: onAddToCart),
        ],
      ),
    );
  }
}
