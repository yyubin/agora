import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Post', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: BackButton(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // TODO: 게시글 발행 로직 구현
              Navigator.pop(context); // 발행 후 화면 닫기
            },
            child: const Text('Publish', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // --- 썸네일 업로드 영역 ---
            GestureDetector(
              onTap: () {
                // TODO: 이미지 피커(image_picker)를 사용한 썸네일 업로드 기능 구현
              },
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined, color: Colors.grey.shade600, size: 40),
                    const SizedBox(height: 8),
                    const Text('Upload Thumbnail Image'),
                    const Text('Size (400x400)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- 제목 입력 필드 (추가된 부분) ---
            TextField(
              controller: _titleController,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: 'Post Title',
                border: InputBorder.none,
              ),
            ),
            const Divider(),

            // --- 내용 입력 필드 ---
            TextField(
              controller: _contentController,
              maxLines: null, // 내용 길이에 따라 자동으로 늘어남
              decoration: const InputDecoration(
                hintText: 'Start typing here...',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}