import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/review.dart';

// 상태: 감상문 리스트
final reviewListProvider = StateNotifierProvider<ReviewListNotifier, List<Review>>(
      (ref) => ReviewListNotifier(),
);

class ReviewListNotifier extends StateNotifier<List<Review>> {
  ReviewListNotifier()
      : super([
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
  ]);

  void addReview(Review review) {
    state = [review, ...state]; // 최신순 추가
  }

  void editReview(int index, Review updatedReview) {
    final updatedList = [...state];
    updatedList[index] = updatedReview;
    state = updatedList;
    print(updatedList[index].content);
  }

  void deleteReview(int index) {
    final updatedList = [...state]..removeAt(index);
    state = updatedList;
  }
}
