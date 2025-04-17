import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../community/screens/review_screen.dart';
import '../../community/screens/review_create_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color accentColor = Color(0xFFE76F51);      // 포인트 컬러
  final Color mainColor = Color(0xFFFFFFFF);        // 메인 배경
  final Color secondaryColor = Color(0xFFA68A64);   // 세컨더리 텍스트/버튼용
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('홈')),
    const ReviewScreen(),
    const ReviewCreateScreen(),
    Center(child: Text('알림')),
    Center(child: Text('프로필')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
