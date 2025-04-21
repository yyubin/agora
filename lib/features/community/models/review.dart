class Review {
  final String title;
  final String date;
  final String content;

  Review({required this.title, required this.date, required this.content});

  @override
  List<Object> get props => [title, date, content];
}

final List<Review> dummyReviews = [
  Review(
    title: '이방인 감상',
    date: '2025.04.18',
    content: '죽음과 삶의 경계에 선 메르소의 고백...',
  ),
  Review(
    title: '데미안 후기',
    date: '2025.04.17',
    content: '자아의 각성과 세계와의 충돌에 대한 이야기.',
  ),
];
