import 'package:flutter/material.dart';
import 'package:agora_flutter/features/onboarding/widgets/page_indicator.dart';
// TODO: 로그인 또는 홈 화면의 경로를 import 하세요.
import 'package:agora_flutter/features/auth/screens/welcome_screen.dart';

// 온보딩 페이지에 필요한 데이터를 담는 클래스
class OnboardingPageData {
  final String imageUrl;
  final String title;
  final String subtitle; // 변경된 부분: subtitle 필드 추가

  OnboardingPageData({
    required this.imageUrl,
    required this.title,
    required this.subtitle, // 변경된 부분: 생성자에 subtitle 추가
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // 온보딩 페이지들의 데이터
  final List<OnboardingPageData> _pages = [
    // 변경된 부분: 각 데이터에 subtitle 추가
    OnboardingPageData(
      imageUrl: 'assets/images/onboarding.png',
      title: '생각을 글로, 글을 대화로.',
      subtitle: '당신의 깊은 사유가 누구에겐 위로가 되고, 영감이 됩니다.',
    ),
    OnboardingPageData(
      imageUrl: 'assets/images/onboarding.png',
      title: '가볍지 않게, 무겁지 않게.',
      subtitle: '삶에 대해 고민하는 사람들과 느슨하게 연결되는 공간.',
    ),
    OnboardingPageData(
      imageUrl: 'assets/images/onboarding.png',
      title: '거창하지 않아도 됩니다.',
      subtitle: '질문 하나, 글귀 하나로도 우리는 삶을 다시 바라볼 수 있어요.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              // 1. 페이지 뷰 (스와이프되는 영역)
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return _OnboardingPage(data: _pages[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),

              // 2. 페이지 인디케이터
              PageIndicator(
                pageCount: _pages.length,
                currentPageIndex: _currentPage,
              ),
              const SizedBox(height: 60),

              // 3. Next 버튼
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3076E0),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  if (_currentPage < _pages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    // 마지막 페이지일 경우, 로그인 또는 홈 화면으로 이동
                    // TODO: 아래 네비게이션 로직을 실제 앱 흐름에 맞게 수정하세요.

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => WelcomeScreen()),
                    );

                    print("Go to Home or Login Screen");
                  }
                },
                child: Text(
                  _currentPage < _pages.length - 1 ? 'Next' : 'Get Started',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 각 온보딩 페이지의 UI를 구성하는 내부 위젯
class _OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;

  const _OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 이미지
        Image.asset(
          data.imageUrl,
          height: 280,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 60),

        // 메인 타이틀
        Text(
          data.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF061730),
            fontSize: 24,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
            height: 1.5, // 줄 간격 추가
          ),
        ),

        // 변경된 부분: 서브타이틀을 위한 SizedBox와 Text 위젯 추가
        const SizedBox(height: 16),
        Text(
          data.subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade600, // 타이틀보다 연한 색상
            fontSize: 16, // 타이틀보다 작은 폰트 크기
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.normal, // 일반 굵기
            height: 1.5, // 줄 간격 추가
          ),
        ),
      ],
    );
  }
}