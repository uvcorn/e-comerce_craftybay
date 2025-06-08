import 'package:crafty/features/common/ui/widgets/c_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});
  static final String name = '/review-screen';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  static const Map<String, String> review = {
    "author": "Rabbi Hasan",
    "content":
        "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
  };

  final List<Map<String, String>> _reviews = List.generate(10, (_) => review);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, __) => Get.back(),
      child: Scaffold(
        appBar: CAppBar(
          title: 'Wish List',
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(height: 1, color: Colors.grey.shade200),
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  final review = _reviews[index];
                  return ListTile(
                    leading: Icon(Icons.person_outline, size: 32),
                    title: Text(
                      review['author'] ?? '',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      review['content'] ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                children: [
                  Text(
                    'Reviews (1000)',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      size: 30,
                      // color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
