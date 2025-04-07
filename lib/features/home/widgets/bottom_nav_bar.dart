import 'package:flutter/material.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  static const Color sunsetOrange = Color(0xFFFF6B4A);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTab(icon: Icons.home, index: 0),
          _buildTab(icon: Icons.forum, index: 1),
          const SizedBox(width: 48), // 가운데 버튼 공간 확보
          _buildTab(icon: Icons.notifications, index: 3),
          _buildTab(icon: Icons.person, index: 4),
        ],
      ),
    );
  }

  Widget _buildTab({required IconData icon, required int index}) {
    final bool isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Container(
          decoration: isSelected
              ? BoxDecoration(
            shape: BoxShape.circle,
            color: sunsetOrange.withOpacity(0.2),
          )
              : null,
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
