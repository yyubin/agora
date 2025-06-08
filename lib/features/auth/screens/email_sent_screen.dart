import 'package:flutter/material.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.mark_email_read_outlined,
              color: Color(0xFF3076E0),
              size: 100,
            ),
            const SizedBox(height: 40),
            const Text(
              'Email Sent',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            const Text(
              'Check your email and click the link to reset your password.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF6D7E97), fontSize: 16),
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: () {
                // 로그인 화면으로 돌아가기 (이전 화면들을 모두 스택에서 제거)
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                side: const BorderSide(color: Color(0xFF3076E0)),
              ),
              child: const Text(
                'Back to Login',
                style: TextStyle(
                  color: Color(0xFF3076E0),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}