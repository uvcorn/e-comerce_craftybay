import 'package:crafty/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty/features/common/ui/widgets/c_app_bar.dart';
import 'package:crafty/features/common/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final MainBottomNavController navController =
      Get.find<MainBottomNavController>();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        navController.backToHome();
      },
      child: Scaffold(
        appBar: CAppBar(
          title: 'Wish List',
          leading: IconButton(
            onPressed: navController.backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
            ),
            itemCount: 30,
            itemBuilder: (context, index) {
              return const FittedBox(child: ProductCard());
            },
          ),
        ),
      ),
    );
  }
}
