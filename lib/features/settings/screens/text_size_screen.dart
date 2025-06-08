import 'package:flutter/material.dart';

class TextSizeScreen extends StatefulWidget {
  const TextSizeScreen({super.key});

  @override
  State<TextSizeScreen> createState() => _TextSizeScreenState();
}

class _TextSizeScreenState extends State<TextSizeScreen> {
  // 슬라이더의 현재 값을 저장하는 상태 변수 (0.0 ~ 4.0, 기본값 2.0)
  double _currentSliderValue = 2.0;

  @override
  Widget build(BuildContext context) {
    // 슬라이더 값에 따라 동적으로 폰트 크기 계산 (예: 14pt ~ 22pt)
    double sampleFontSize = 14 + (_currentSliderValue * 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Size', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: BackButton(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // --- 슬라이더 UI ---
            Row(
              children: [
                const Text('A', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 4,
                    divisions: 4, // 5개의 구간으로 나눔
                    label: _currentSliderValue.round().toString(),
                    activeColor: const Color(0xFF061730),
                    inactiveColor: Colors.grey.shade300,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
                const Text('A', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 40),

            // --- 예시 텍스트 ---
            Text(
              'Move the slider and observe how it affects your preferred text size.',
              style: TextStyle(
                color: const Color(0xFF6D7E97),
                fontSize: sampleFontSize, // 슬라이더 값에 따라 폰트 크기 변경
                fontWeight: FontWeight.w600,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}