import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/review_provider.dart';
import '../providers/like_provider.dart';

class ReviewDetailScreen extends ConsumerWidget {
  final int index;

  const ReviewDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final review = ref.watch(
      reviewListProvider.select((list) => list[index]),
    );
    final isLiked = ref.watch(likesProvider)[index] ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text(review.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.push('/reviews/edit/$index');
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref.read(reviewListProvider.notifier).deleteReview(index);
              context.pop(); // 리스트로 복귀
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(review.content, style: const TextStyle(fontSize: 16)),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 좋아요 버튼
            IconButton(
              iconSize: 28,
              tooltip: '좋아요',
              icon: Icon(
                isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                color: isLiked ? Colors.blue : null,
              ),
              onPressed: () =>
                  ref.read(likesProvider.notifier).toggle(index),
            ),

            // 댓글 버튼
            IconButton(
              iconSize: 28,
              tooltip: '댓글',
              icon: const Icon(Icons.chat_bubble_outline),
              onPressed: () =>
                  context.push('/reviews/detail/$index/comments'),
            ),
          ],
        ),
      ),
    );
  }
}