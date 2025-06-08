import 'package:crafty/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty/features/common/ui/widgets/c_app_bar.dart';
import 'package:crafty/features/common/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
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
          title: Text('Categories'),
          leading: IconButton(
            onPressed: navController.backToHome,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: 30,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: ProductCategoryItem());
            },
          ),
        ),
      ),
    );
  }
}
