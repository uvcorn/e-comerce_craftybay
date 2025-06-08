import 'package:crafty/features/review/data/models/review_model.dart';
import 'package:flutter/material.dart';
import 'review_tile.dart';

class ReviewList extends StatelessWidget {
  final List<ReviewModel> reviews;
  const ReviewList({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          Divider(height: 1, color: Colors.grey.shade200),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return ReviewTile(review: reviews[index]);
      },
    );
  }
}
