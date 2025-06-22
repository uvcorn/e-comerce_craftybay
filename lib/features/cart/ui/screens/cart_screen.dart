import 'package:crafty/features/cart/ui/widgets/cart_item.dart';
import 'package:crafty/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty/features/common/ui/widgets/c_app_bar.dart';
import 'package:crafty/features/common/ui/widgets/cart_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static final String name = '/cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final MainBottomNavController navController =
      Get.find<MainBottomNavController>();

  final int totalPrice = 100;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        navController.backToHome();
      },
      child: Scaffold(
        appBar: CAppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: navController.backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.separated(
                  itemCount: 12,
                  itemBuilder: (context, index) => const CartItem(),
                  separatorBuilder: (_, __) => const SizedBox(height: 4),
                ),
              ),
            ),
            CartBottomBar(
              totalPrice: totalPrice,
              buttonText: 'Checkout',
              onCheckout: () {},
            ),
          ],
        ),
      ),
    );
  }
}
