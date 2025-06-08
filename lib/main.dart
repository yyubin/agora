import 'package:flutter/material.dart';
import 'package:agora_flutter/features/onboarding/screens/splash_screen.dart'; // 방금 만든 SplashScreen의 경로

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 디버그 모드에서 우측 상단에 뜨는 'DEBUG' 배너를 제거합니다.
      debugShowCheckedModeBanner: false,

      // 앱의 전체적인 테마를 설정할 수 있습니다.
      // 지금은 기본 테마를 사용하지만, 추후 'core/theme/app_theme.dart'에서 관리할 수 있습니다.
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white, // 앱의 기본 배경색을 흰색으로 설정
      ),

      // 앱이 시작될 때 가장 먼저 보여줄 화면을 지정합니다.
      // SplashScreen을 home으로 지정하면, 앱 실행 시 스플래시 화면이 나타나고,
      // SplashScreen 내부 로직에 의해 3초 후 OnboardingScreen으로 자동 이동합니다.
      home: SplashScreen(),
    );
  }
}