import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/review_card.dart';
import '../models/review.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('감상문 리스트')),
      body: ListView.builder(
        itemCount: dummyReviews.length,
        itemBuilder: (context, index) {
          return ReviewCard(review: dummyReviews[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/reviews/create').then((_) {
            // 돌아왔을 때 화면 새로고침이 필요한 경우 여기서 setState()
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
