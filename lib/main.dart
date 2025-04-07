import 'package:flutter/material.dart';
import 'features/home/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아고라',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        fontFamily: 'Pretendard',
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
