import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/comment.dart';

/// 리뷰마다 댓글 리스트를 따로 관리 (key = reviewIndex)
final commentListProvider =
StateNotifierProvider.family<CommentListNotifier, List<Comment>, int>(
      (ref, reviewIdx) => CommentListNotifier(),
);

class CommentListNotifier extends StateNotifier<List<Comment>> {
  CommentListNotifier() : super([]);

  final _uuid = const Uuid();

  void add(String author, String content) {
    state = [
      Comment(
        id: _uuid.v4(),
        author: author,
        content: content,
        date: DateTime.now(),
      ),
      ...state,
    ];
  }

  void edit(String id, String content) {
    state = [
      for (final c in state)
        if (c.id == id) c.copyWith(content: content) else c
    ];
  }

  void delete(String id) {
    state = state.where((c) => c.id != id).toList();
  }
}
