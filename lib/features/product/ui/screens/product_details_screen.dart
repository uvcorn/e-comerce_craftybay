import 'package:crafty/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty/features/common/ui/widgets/c_app_bar.dart';
import 'package:crafty/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:crafty/features/product/ui/controller/product_controller.dart';
import 'package:crafty/features/product/ui/widget/color_selector.dart';
import 'package:crafty/features/product/ui/widget/order_counter.dart';
import 'package:crafty/features/product/ui/widget/price_and_cart_section.dart';
import 'package:crafty/features/product/ui/widget/product_review_section.dart';
import 'package:crafty/features/product/ui/widget/size_sector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    final MainBottomNavController navController =
        Get.find<MainBottomNavController>();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => navController.backToHome(),
      child: Scaffold(
        appBar: CAppBar(
          leading: IconButton(
            onPressed: navController.backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Product Details',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Obx(
                () => HomeCarouselSlider(
                  productImage: controller.currentProductImages,
                  autoplay: false,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Happy New Year Special \n Deal save 30%',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Obx(
                    () => OrderCounter(
                      count: controller.orderCount,
                      onIncrement: controller.incrementOrder,
                      onDecrement: controller.decrementOrder,
                    ),
                  ),
                ],
              ),
              const ProductReviewSection(), // Extracted review section
              const SizedBox(height: 16),
              Text('Color', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Obx(
                () => ColorSelector(
                  colors: controller.colorToImages.keys.toList(),
                  selectedColor: controller.selectedColor,
                  onColorSelected: controller.selectColor,
                ),
              ),
              const SizedBox(height: 16),
              Text('Size', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Obx(
                () => SizeSelector(
                  sizes: ProductController.availableSizes,
                  selectedSize: controller.selectedSize,
                  onSizeSelected: controller.selectSize,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              const SizedBox(height: 16),
              PriceAndCartSection(
                price: '৳1,000',
                onAddToCart: controller.addToCart,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
