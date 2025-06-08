import 'package:crafty/features/common/ui/widgets/c_app_bar.dart';
import 'package:crafty/features/review/ui/controller/review_controller.dart';
import 'package:crafty/features/review/ui/widget/review_bottom_bar.dart';
import 'package:crafty/features/review/ui/widget/review_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});
  static final String name = '/review-screen';

  @override
  Widget build(BuildContext context) {
    // Put this in your bindings or in main, not in build:
    final ReviewController controller = Get.find<ReviewController>();

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, __) => Get.back(),
      child: Scaffold(
        appBar: CAppBar(
          title: 'Reviews',
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => ReviewList(reviews: controller.reviews.toList()),
              ),
            ),
            Obx(
              () => ReviewBottomBar(
                reviewCount: controller.reviews.length,
                onAdd: () {
                  // Example: open add review dialog
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
