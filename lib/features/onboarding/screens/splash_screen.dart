import 'package:agora_flutter/features/main_navigation/main_screen.dart';
import 'package:agora_flutter/features/onboarding/screens/onboarding_screen.dart';
import 'package:agora_flutter/core/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 위젯이 빌드된 후 딱 한 번만 실행되도록 예약
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthAndNavigate();
    });
  }

  Future<void> _checkAuthAndNavigate() async {
    // AuthProvider 인스턴스를 가져옴
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    // 로그인 상태 확인 (SharedPreferences 조회)
    await authProvider.checkLoginStatus();

    // 1~2초 정도 스플래시 화면을 더 보여주기 위한 딜레이 (선택사항)
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) { // 위젯이 여전히 화면에 있는지 확인
      if (authProvider.isLoggedIn) {
        // 로그인 되어 있으면: MainScreen으로 이동
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainScreen()),
        );
      } else {
        // 로그인 되어 있지 않으면: OnboardingScreen으로 이동
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo.png')
      ),
    );
  }
}
