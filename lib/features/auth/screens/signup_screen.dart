import 'package:agora_flutter/features/auth/screens/login_screen.dart';
import 'package:agora_flutter/features/auth/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.grey.shade800),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign Up Now!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            const Text(
              'Sign up to see stories around the world!',
              style: TextStyle(color: Color(0xFF6D7E97), fontSize: 14),
            ),
            const SizedBox(height: 40),
            const CustomTextFormField(
              label: 'Username',
              hintText: 'Enter your username',
            ),
            const SizedBox(height: 24),
            const CustomTextFormField(
              label: 'Email',
              hintText: 'Enter your email',
            ),
            const SizedBox(height: 24),
            const CustomTextFormField(
              label: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // TODO: 회원가입 로직 구현
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3076E0),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                      color: Color(0xFF6D7E97),
                      fontSize: 14,
                      fontFamily: 'Open Sans'),
                  children: [
                    const TextSpan(text: 'Already have an account? '),
                    TextSpan(
                      text: 'Log In',
                      style: const TextStyle(
                        color: Color(0xFF3177E0),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // 로그인 화면으로 이동
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()));
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}