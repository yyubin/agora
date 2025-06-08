import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  // 앱 시작 시 로그인 상태를 확인하는 메소드
  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // 'userToken'과 같은 값이 저장되어 있으면 로그인 된 것으로 간주
    _isLoggedIn = prefs.getString('userToken') != null;
    notifyListeners(); // 상태 변경을 다른 위젯에 알림
  }

  // 로그인 시 호출될 메소드
  Future<void> login(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', token); // 기기에 토큰 저장
    _isLoggedIn = true;
    notifyListeners();
  }

  // 로그아웃 시 호출될 메소드
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken'); // 기기에서 토큰 삭제
    _isLoggedIn = false;
    notifyListeners();
  }
}