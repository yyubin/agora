import 'package:agora_flutter/features/home/screens/home_screen.dart';
import 'package:agora_flutter/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 현재 선택된 탭의 인덱스를 관리하는 변수
  int _selectedIndex = 0;

  // 각 탭에 해당하는 화면 위젯 리스트
  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    // TODO: Add Post 화면은 버튼에서 직접 다른 방식으로 호출할 것이므로 비워둡니다.
    const Scaffold(body: Center(child: Text('Saved Screen'))), // 저장 화면
    const Scaffold(body: Center(child: Text('Profile Screen'))), // 프로필 화면
  ];

  void _onItemTapped(int index) {
    // 탭을 눌렀을 때, _selectedIndex를 변경하고 화면을 다시 그리도록 요청
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 현재 선택된 탭에 맞는 화면을 body에 표시
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      // 플로팅 액션 버튼 (글쓰기 버튼)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 글쓰기 화면으로 이동하는 로직 구현
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF3177E0),
        child: const Icon(Icons.add, color: Colors.white),
      ),

      // 플로팅 버튼 위치를 중앙으로
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 하단 네비게이션 바
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // 플로팅 버튼 주변을 파는 효과
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(icon: Icons.home_outlined, index: 0),
              _buildNavItem(icon: Icons.search, index: 1),
              const SizedBox(width: 40), // 플로팅 버튼이 차지할 공간
              _buildNavItem(icon: Icons.bookmark_border, index: 2),
              _buildNavItem(icon: Icons.person_outline, index: 3),
            ],
          ),
        ),
      ),
    );
  }

  // 네비게이션 바 아이템을 만드는 위젯
  Widget _buildNavItem({required IconData icon, required int index}) {
    return IconButton(
      icon: Icon(
        icon,
        color: _selectedIndex == index ? const Color(0xFF3177E0) : Colors.grey,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}