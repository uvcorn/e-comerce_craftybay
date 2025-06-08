class ReviewModel {
  final String author;
  final String content;

  const ReviewModel({required this.author, required this.content});

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      author: map['author'] ?? '',
      content: map['content'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'author': author, 'content': content};
  }
}
