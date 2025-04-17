import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: '감상문 앱',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
      ),
    );
  }
}
