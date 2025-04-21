import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/screens/home_screen.dart';
import '../features/community/screens/review_screen.dart';
import '../features/community/screens/review_detail_screen.dart';
import '../features/community/screens/review_create_screen.dart';
import '../features/community/models/review.dart';
import '../features/community//screens/review_edit_screen.dart';

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
          path: 'reviews/detail/:index',
          builder: (context, state) {
            final index = int.parse(state.pathParameters['index']!);
            return ReviewDetailScreen(index: index, key: ValueKey(state.fullPath));
          },
        ),
        GoRoute(
          path: 'reviews/create',
          builder: (context, state) => const ReviewCreateScreen(),
        ),
        GoRoute(
          path: 'reviews/edit/:index',
          builder: (context, state) {
            final index = int.parse(state.pathParameters['index']!);
            return ReviewEditScreen(index: index);
          },
        ),
      ],
    ),
  ],
);
