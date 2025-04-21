import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/review_provider.dart';

class ReviewDetailScreen extends ConsumerWidget {
  final int index;

  const ReviewDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final review = ref.watch(
      reviewListProvider.select((list) => list[index]),
    );

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
    );
  }
}
