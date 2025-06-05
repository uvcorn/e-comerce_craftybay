import 'package:crafty/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty/features/common/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _backToHme();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wish List'),
          leading: IconButton(
            onPressed: _backToHme,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
            ),
            itemCount: 30,
            itemBuilder: (context, index) {
              return FittedBox(child: ProductCard());
            },
          ),
        ),
      ),
    );
  }

  void _backToHme() {
    Get.find<MainBottomNavController>().backTohome();
    Get.offAllNamed(MainBottomNavScreen.name);
  }
}
