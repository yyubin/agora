import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy & Policy', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: BackButton(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy & Policy’s',
              style: TextStyle(
                color: Color(0xFF061730),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'We will help you protect yourself by generating a Privacy Policy.\n\nOur Privacy Policy Generator can help you make sure that your business complies with the law. We are here to help you protect your business, yourself and your customers.\n\nFill in the blank spaces below and we will create a personalized website Privacy Policy for your business. No account registration required. Simply generate & download a Privacy Policy in seconds!',
              style: TextStyle(
                color: const Color(0xFF6D7E97),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.86,
              ),
            ),
          ],
        ),
      ),
    );
  }
}