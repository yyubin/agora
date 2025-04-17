import 'package:flutter/material.dart';
import 'routes/app_router.dart';

void main() {
  runApp(MyApp());
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
