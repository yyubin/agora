import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: BackButton(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TODO: 앱 로고 아이콘으로 교체하세요.
            const Icon(
              Icons.info_outline_rounded,
              size: 80,
              color: Color(0xFF3076E0),
            ),
            const SizedBox(height: 24),
            const Text(
              'About App',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF061730),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Each essential feature should be listed in precise and succinct detail. This ensures that users take advantage of everything your app offers so that they are fully satisfied with the purchase.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF6D7E97),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Remember, no one reads help texts until they are already disgruntled.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF6D7E97),
                fontSize: 14,
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