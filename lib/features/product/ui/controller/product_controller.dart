import 'package:crafty/app/app_colors.dart';
import 'package:crafty/app/asset_path.dart';
import 'package:crafty/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final Rx<Color> _selectedColor = Colors.black.obs;
  final RxString _selectedSize = 'L'.obs;
  final RxInt _orderCount = 1.obs;

  // Static product data (can be fetched from a service in a real app)
  static const List<String> availableSizes = ['L', 'X', 'XL', 'XXL'];
  final Map<Color, List<String>> colorToImages = {
    Colors.black: [AssetPath.blackShoe],
    Colors.brown: [AssetPath.brownShoe],
    Colors.blue: [AssetPath.blueShoe],
    Colors.grey: [AssetPath.greyShoe],
    Colors.white: [AssetPath.whiteShoe],
  };

  // Getters for reactive state
  Color get selectedColor => _selectedColor.value;
  String get selectedSize => _selectedSize.value;
  int get orderCount => _orderCount.value;
  List<String> get currentProductImages => colorToImages[selectedColor] ?? [];

  // Actions
  void incrementOrder() => _orderCount.value++;
  void decrementOrder() {
    if (_orderCount.value > 1) _orderCount.value--;
  }

  void selectColor(Color color) => _selectedColor.value = color;
  void selectSize(String size) => _selectedSize.value = size;

  void backToHome() {
    Get.find<MainBottomNavController>().backTohome();
    Get.offAllNamed(MainBottomNavScreen.name);
  }

  void addToCart() {
    // Implement your add to cart logic here
    Get.snackbar(
      'Added to Cart',
      'Product added with color: ${selectedColor.toString().split('.').last}, size: $selectedSize, quantity: $orderCount',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.themeColor,
      colorText: Colors.white,
    );
  }
}
