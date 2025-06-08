import 'package:agora_flutter/features/auth/screens/login_screen.dart';
import 'package:agora_flutter/features/auth/widgets/social_login_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Color(0xFF061730),
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Hello there, Continue with and see the stories from around the world.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF6D7E97), fontSize: 12),
              ),
              const Spacer(flex: 2),
              SocialLoginButton(
                icon: const Icon(Icons.apple, color: Colors.black),
                text: 'Continue with Apple',
                onPressed: () {
                  // TODO: Apple 로그인 로직 구현
                },
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                icon: Icon(Bootstrap.google),
                text: 'Continue with Google',
                onPressed: () {
                  // TODO: Google 로그인 로직 구현
                },
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                icon: const Icon(Icons.email_outlined, color: Colors.black54),
                text: 'Continue with Email',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
              ),
              const Spacer(),
              RichText(
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
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                        },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                'By continuing, you accept the Terms Of Use and Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF6D7E97), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}