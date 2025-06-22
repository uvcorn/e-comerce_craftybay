import 'package:crafty/app/app_colors.dart';
import 'package:crafty/app/constant.dart';
import 'package:flutter/material.dart';

class CartBottomBar extends StatelessWidget {
  final int totalPrice;
  final String buttonText;
  final VoidCallback onCheckout;

  const CartBottomBar({
    super.key,
    required this.totalPrice,
    required this.buttonText,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.themeColor.withOpacity(0.3),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                "${Constant.takaSign}$totalPrice",
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
              onPressed: onCheckout,
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
