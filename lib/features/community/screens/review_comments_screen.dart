import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/comment.dart';
import '../providers/comment_provider.dart';

class ReviewCommentsScreen extends ConsumerWidget {
  const ReviewCommentsScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(commentListProvider(index));
    final ctrl = TextEditingController();

    Future<void> _showEditDialog(Comment c) async {
      final editCtrl = TextEditingController(text: c.content);
      final ok = await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('댓글 수정'),
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

    return Scaffold(
      appBar: AppBar(title: const Text('댓글')),
      body: Column(
        children: [
          // ----- 댓글 입력 -----
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

          // ----- 댓글 목록 -----
          Expanded(
            child: comments.isEmpty
                ? const Center(child: Text('첫 댓글을 남겨보세요!'))
                : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: comments.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (_, i) {
                final c = comments[i];
                return ListTile(
                  title: Text(c.author),
                  subtitle: Text(c.content),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, size: 20),
                        onPressed: () => _showEditDialog(c),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, size: 20),
                        onPressed: () => ref.read(commentListProvider(index).notifier).delete(c.id),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
