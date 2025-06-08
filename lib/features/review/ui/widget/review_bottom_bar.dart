import 'package:flutter/material.dart';

class ReviewBottomBar extends StatelessWidget {
  final int reviewCount;
  final VoidCallback onAdd;
  const ReviewBottomBar({
    super.key,
    required this.reviewCount,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Text(
            'Reviews ($reviewCount)',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: onAdd,
            mini: true,
            child: const Icon(Icons.add, size: 30),
          ),
        ],
      ),
    );
  }
}
