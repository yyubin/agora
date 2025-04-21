import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/comment.dart';

final commentListProvider =
StateNotifierProvider.family<CommentListNotifier, List<Comment>, int>(
      (ref, reviewIdx) => CommentListNotifier(),
);

class CommentListNotifier extends StateNotifier<List<Comment>> {
  CommentListNotifier() : super([]);

  final _uuid = const Uuid();

  // ========== CRUD ==========
  void add(String author, String content, {String? parentId}) {
    state = [
      Comment(
        id: _uuid.v4(),
        author: author,
        content: content,
        date: DateTime.now(),
        parentId: parentId,
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
    // 원댓글 삭제 시 그 대댓글도 함께 제거
    state = state.where((c) => c.id != id && c.parentId != id).toList();
  }
}
