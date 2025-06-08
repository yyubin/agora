import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // 각 입력 필드를 제어하기 위한 컨트롤러
  final _usernameController = TextEditingController(text: 'zee3543');
  final _emailController = TextEditingController(text: 'zee595@gmail.com');
  final _phoneController = TextEditingController(text: '35353005');

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: BackButton(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 프로필 사진 수정 위젯 ---
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/avatar_zee.png'), // TODO: 실제 프로필 이미지
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // TODO: 이미지 피커를 사용한 프로필 사진 변경 로직 구현
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, color: Colors.white, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // --- 개인 정보 입력 필드 ---
            const Text(
              'Personal Info',
              style: TextStyle(color: Color(0xFF6D7E97), fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            _buildInfoTextField(controller: _usernameController, label: 'Username'),
            _buildInfoTextField(controller: _emailController, label: 'Email'),
            _buildInfoTextField(controller: _phoneController, label: 'Phone'),

            // --- 이메일 및 비밀번호 변경 옵션 ---
            const SizedBox(height: 20),
            _buildChangeOption(context, label: 'Change Email', onTap: () {}),
            const Divider(height: 1),
            _buildChangeOption(context, label: 'Change Password', onTap: () {}),
            const SizedBox(height: 40),

            // --- 저장 버튼 ---
            ElevatedButton(
              onPressed: () {
                // TODO: 변경된 프로필 정보 저장 로직 구현 (API 호출 등)
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3076E0),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 정보 입력을 위한 텍스트 필드 위젯
  Widget _buildInfoTextField({required TextEditingController controller, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD6E5EA)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3076E0)),
          ),
        ),
      ),
    );
  }

  // 'Change Email/Password' 같은 옵션을 위한 위젯
  Widget _buildChangeOption(BuildContext context, {required String label, required VoidCallback onTap}) {
    return ListTile(
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
    );
  }
}