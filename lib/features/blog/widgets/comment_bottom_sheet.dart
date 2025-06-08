import 'package:agora_flutter/core/models/author_model.dart';
import 'package:agora_flutter/core/models/comment_model.dart';
import 'package:agora_flutter/features/blog/widgets/comment_tile.dart';
import 'package:flutter/material.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({super.key});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final _commentController = TextEditingController();

  // 댓글 샘플 데이터 (나중에 API로 대체)
  final List<Comment> _comments = [
    Comment(id: 'c1', author: Author(name: 'Andrew Rash', avatarUrl: 'assets/images/avatar2.png'), text: '정말 유익한 글이네요! 많이 배워갑니다.', timestamp: '2 hours ago'),
    Comment(id: 'c2', author: Author(name: 'Zee', avatarUrl: 'assets/images/avatar_zee.png'), text: '저도 이 부분에 대해 항상 궁금했었는데, 감사합니다.', timestamp: '1 hour ago'),
  ];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _postComment() {
    if (_commentController.text.trim().isEmpty) return;

    // TODO: 실제 댓글 전송 로직 구현 (API 호출 등)
    print('New Comment: ${_commentController.text}');

    // UI에 즉시 반영 (실제로는 API 응답 성공 후 처리)
    setState(() {
      _comments.add(Comment(
        id: 'c${_comments.length + 1}',
        author: Author(name: 'MySelf', avatarUrl: 'assets/images/avatar_zee.png'), // 현재 사용자 정보
        text: _commentController.text,
        timestamp: 'Just now',
      ));
      _commentController.clear();
      FocusScope.of(context).unfocus(); // 키보드 내리기
    });
  }

  @override
  Widget build(BuildContext context) {
    // 키보드가 올라왔을 때의 UI 깨짐을 방지
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: keyboardSpace),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75, // 화면의 75% 높이
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- 헤더 ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Comments (${_comments.length})', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(),

            // --- 댓글 목록 ---
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) => CommentTile(comment: _comments[index]),
              ),
            ),
            const Divider(),

            // --- 댓글 입력 필드 ---
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF3177E0)),
                    onPressed: _postComment,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}