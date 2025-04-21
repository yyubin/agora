class Comment {
  Comment({
    required this.id,
    required this.author,
    required this.content,
    required this.date,
  });

  final String id;      // uuid 등
  final String author;
  final String content;
  final DateTime date;

  Comment copyWith({String? content}) => Comment(
    id: id,
    author: author,
    content: content ?? this.content,
    date: date,
  );
}
