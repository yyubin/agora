import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/screens/home_screen.dart';
import '../features/community/screens/review_screen.dart';
import '../features/community/screens/review_detail_screen.dart';
import '../features/community/models/review.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'reviews',
          builder: (context, state) => const ReviewScreen(),
        ),
        GoRoute(
          path: 'reviews/detail',
          builder: (context, state) {
            final review = state.extra as Review;
            return ReviewDetailScreen(review: review);
          },
        ),
      ],
    ),
  ],
);
