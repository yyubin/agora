import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/review_provider.dart';

class ReviewCommentsScreen extends ConsumerWidget {
  final int index;

  const ReviewCommentsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final review = ref.watch(reviewListProvider)[index];

    return Scaffold(
      appBar: AppBar(title: Text('댓글 - ${review.title}')),
      body: const Center(
        child: Text('댓글 기능은 아직 준비 중입니다 😉'),
      ),
    );
  }
}
