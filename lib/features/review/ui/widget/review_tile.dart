import 'package:crafty/features/review/data/models/review_model.dart';
import 'package:flutter/material.dart';

class ReviewTile extends StatelessWidget {
  final ReviewModel review;
  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person_outline, size: 32),
      title: Text(
        review.author,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        review.content,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 13),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }
}
