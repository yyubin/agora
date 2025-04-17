import 'package:flutter/material.dart';
import '../widgets/review_card.dart';
import '../models/review.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

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
    );
  }
}
