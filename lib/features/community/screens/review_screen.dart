import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../widgets/review_card.dart';
import '../providers/review_provider.dart';
import '../models/review.dart';

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(reviewListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('감상문 리스트')),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ReviewCard(review: reviews[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/reviews/create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
