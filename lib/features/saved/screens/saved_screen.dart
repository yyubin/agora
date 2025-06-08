import 'package:agora_flutter/core/models/author_model.dart';
import 'package:agora_flutter/core/models/post_model.dart';
import 'package:agora_flutter/features/blog/screens/post_detail_screen.dart';
import 'package:agora_flutter/features/home/widgets/following_post_card.dart'; // 재사용할 위젯
import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  // 저장된 게시물 샘플 데이터 (나중에는 Provider나 DB에서 관리)
  static final Author _author1 = Author(name: 'Melinda Deshina', avatarUrl: 'assets/images/avatar1.png');
  static final Author _author2 = Author(name: 'Andrew Rash', avatarUrl: 'assets/images/avatar2.png');

  static final List<Post> _savedPosts = [
    Post(id: '3', title: 'Why Design is More Important in Now Days.', subtitle: 'Welcome to enterprise projects. There are many decisions. For each one, you have to create decision criteria, do research, validate findings...', imageUrl: 'assets/images/post1.png', author: _author2, category: 'Why You Need to learn Design?', readTime: '5 min', timestamp: '', content: '...'),
    Post(id: '4', title: 'How do I Start Content Writing With No Experience', subtitle: 'Yet another great way to train yourself to write better content is through online courses. There are many content writing courses available online that you can choose from.', imageUrl: 'assets/images/post2.png', author: _author1, category: 'How to learn Content Writing?', readTime: '5 min', timestamp: '', content: '...'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20.0),
        itemCount: _savedPosts.length,
        itemBuilder: (context, index) {
          final post = _savedPosts[index];
          // 홈 화면에서 사용했던 FollowingPostCard를 그대로 재사용합니다.
          return FollowingPostCard(
            post: post,
            onTap: () {
              // 게시물 카드를 누르면 상세 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PostDetailScreen(post: post)),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          // 각 게시물 카드 사이에 구분선을 넣습니다.
          return const Divider(height: 40, thickness: 1);
        },
      ),
    );
  }
}