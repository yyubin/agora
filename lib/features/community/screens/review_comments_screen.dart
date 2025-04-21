import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/comment_provider.dart';
import '../models/comment.dart';

class ReviewCommentsScreen extends ConsumerWidget {
  const ReviewCommentsScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(commentListProvider(index));
    final ctrl = TextEditingController();

    // ---------- 공통 다이얼로그 ----------
    Future<void> _showEditDialog(Comment c) async {
      final editCtrl = TextEditingController(text: c.content);
      final ok = await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('수정'),
          content: TextField(controller: editCtrl, maxLines: 3),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('취소')),
            ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('저장')),
          ],
        ),
      );
      if (ok ?? false) {
        ref.read(commentListProvider(index).notifier).edit(c.id, editCtrl.text.trim());
      }
    }

    Future<void> _showReplyDialog(Comment parent) async {
      final replyCtrl = TextEditingController();
      final ok = await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('대댓글 작성'),
          content: TextField(controller: replyCtrl, maxLines: 3),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('취소')),
            ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('등록')),
          ],
        ),
      );
      if (ok ?? false && replyCtrl.text.trim().isNotEmpty) {
        ref.read(commentListProvider(index).notifier)
            .add('익명', replyCtrl.text.trim(), parentId: parent.id);
      }
    }

    // ---------- 빌드 ----------
    List<Comment> roots = comments.where((c) => c.parentId == null).toList();
    List<Comment> childrenOf(String id) =>
        comments.where((c) => c.parentId == id).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('댓글')),
      body: Column(
        children: [
          // 입력창
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: ctrl,
                    decoration: const InputDecoration(
                      hintText: '댓글을 입력하세요',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  child: const Text('등록'),
                  onPressed: () {
                    final text = ctrl.text.trim();
                    if (text.isNotEmpty) {
                      ref.read(commentListProvider(index).notifier).add('익명', text);
                      ctrl.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 0),

          // 댓글 & 대댓글 리스트
          Expanded(
            child: roots.isEmpty
                ? const Center(child: Text('첫 댓글을 남겨보세요!'))
                : ListView.builder(
              itemCount: roots.length,
              itemBuilder: (_, i) {
                final c = roots[i];
                final replies = childrenOf(c.id);
                return Column(
                  children: [
                    _CommentTile(
                      comment: c,
                      onEdit: () => _showEditDialog(c),
                      onDelete: () => ref.read(commentListProvider(index).notifier).delete(c.id),
                      onReply: () => _showReplyDialog(c),
                    ),
                    ...replies.map(
                          (r) => Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: _CommentTile(
                          comment: r,
                          onEdit: () => _showEditDialog(r),
                          onDelete: () => ref.read(commentListProvider(index).notifier).delete(r.id),
                        ),
                      ),
                    ),
                    const Divider(height: 0),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ----- 공통 ListTile -----
class _CommentTile extends StatelessWidget {
  const _CommentTile({
    required this.comment,
    this.onEdit,
    this.onDelete,
    this.onReply,
  });

  final Comment comment;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onReply;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(comment.author),
      subtitle: Text(comment.content),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (onReply != null)
            IconButton(icon: const Icon(Icons.reply, size: 20), onPressed: onReply),
          if (onEdit != null)
            IconButton(icon: const Icon(Icons.edit,  size: 20), onPressed: onEdit),
          if (onDelete != null)
            IconButton(icon: const Icon(Icons.delete_outline, size: 20), onPressed: onDelete),
        ],
      ),
    );
  }
}
