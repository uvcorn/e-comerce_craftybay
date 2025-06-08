import 'package:crafty/features/review/data/models/review_model.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  final RxList<ReviewModel> reviews = <ReviewModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchReviews();
  }

  void fetchReviews() {
    // Simulate API call - replace with real data source later
    reviews.value = List.generate(
      10,
      (_) => const ReviewModel(
        author: "Rabbi Hasan",
        content:
            "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      ),
    );
  }

  void addReview(ReviewModel review) {
    reviews.add(review);
  }
}
