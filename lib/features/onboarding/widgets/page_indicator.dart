import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPageIndex;

  const PageIndicator({
    super.key,
    required this.pageCount,
    required this.currentPageIndex,
  });

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 6,
      width: isActive ? 20 : 6,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF3177E0) : const Color(0xFFBFC6CC),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> dots = [];
    for (int i = 0; i < pageCount; i++) {
      dots.add(_buildDot(i == currentPageIndex));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }
}