class Comment {
  Comment({
    required this.id,
    required this.author,
    required this.content,
    required this.date,
    this.parentId,                 // ★ null이면 ‘원댓글’, 값이 있으면 그 ID의 대댓글
  });

  final String id;
  final String author;
  final String content;
  final DateTime date;
  final String? parentId;          // null | 원댓글 ID

  Comment copyWith({String? content}) => Comment(
    id: id,
    author: author,
    content: content ?? this.content,
    date: date,
    parentId: parentId,
  );
}
