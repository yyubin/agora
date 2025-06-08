import 'package:agora_flutter/core/services/auth_provider.dart';
import 'package:agora_flutter/features/auth/screens/welcome_screen.dart';
import 'package:agora_flutter/features/settings/screens/privacy_policy_screen.dart';
import 'package:agora_flutter/features/settings/screens/text_size_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'about_screen.dart';
import 'edit_profile_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          _buildSettingsTile(
            context,
            title: 'Edit Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditProfileScreen()),
              );
            },
          ),
          _buildSettingsTile(
            context,
            title: 'Notifications',
            onTap: () { /* TODO: Notifications 화면으로 이동 */ },
          ),
          ListTile(
            title: const Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.w600)),
            trailing: CupertinoSwitch(
              value: _isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                  // TODO: 다크 모드/라이트 모드 테마 변경 로직 구현
                });
              },
            ),
          ),
          const Divider(height: 1),
          _buildSettingsTile(context, title: 'Text Size',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TextSizeScreen()),
              );
          },),
          _buildSettingsTile(context, title: 'About',
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutScreen()),
              );
          },),
          _buildSettingsTile(context, title: 'Privacy & Policy',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()),
              );
          },),

          // --- 로그아웃 버튼 ---
          ListTile(
            title: const Text('Log Out', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
            onTap: () async {
              final authProvider = Provider.of<AuthProvider>(context, listen: false);
              await authProvider.logout();

              if(mounted) {
                // 로그인/온보딩 화면으로 이동하고 이전의 모든 화면 기록을 삭제
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                      (route) => false,
                );
              }
            },
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }

  // 반복되는 ListTile을 만들기 위한 헬퍼 위젯
  Widget _buildSettingsTile(BuildContext context, {required String title, Widget? trailing, VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
        const Divider(height: 1, indent: 16, endIndent: 16),
      ],
    );
  }
}