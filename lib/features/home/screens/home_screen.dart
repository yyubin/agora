import 'package:agora_flutter/core/models/author_model.dart';
import 'package:agora_flutter/core/models/post_model.dart';
import 'package:agora_flutter/features/blog/screens/post_detail_screen.dart';
import 'package:agora_flutter/features/home/widgets/featured_post_card.dart';
import 'package:agora_flutter/features/home/widgets/following_post_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // 샘플 데이터 (나중에 API로 대체)
  static final Author _author1 = Author(name: 'Melinda Deshina', avatarUrl: 'assets/images/avatar1.png');
  static final Author _author2 = Author(name: 'Andrew Rash', avatarUrl: 'assets/images/avatar2.png');

  static final List<Post> _featuredPosts = [
    Post(id: '1', title: 'Technology to Expect 2023', subtitle: '', content: '', imageUrl: 'assets/images/post1.png', author: _author1, category: 'Technology', readTime: '5 min', timestamp: '6 hours ago'),
    Post(id: '2', title: 'Organic Food in 2023', subtitle: '', content: '', imageUrl: 'assets/images/post2.png', author: _author2, category: 'Food', readTime: '10 min', timestamp: '10 hours ago'),
  ];

  static final List<Post> _followingPosts = [
    Post(id: '3', title: 'Why Design is More Important in Now Days.', subtitle: 'Welcome to enterprise projects. There are many decisions. For each one, you have to create decision criteria, do research, validate findings...', imageUrl: '', author: _author2, category: 'Why You Need to learn Design?', readTime: '5 min', timestamp: '', content: 'dd'),
    Post(id: '4', title: 'How do I Start Content Writing With No Experience', subtitle: 'Yet another great way to train yourself to write better content is through online courses. There are many content writing courses available online that you can choose from.', imageUrl: '', author: _author1, category: 'How to learn Content Writing?', readTime: '5 min', timestamp: '', content: 'dd'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 상단 헤더 ---
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, Zee!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text('Let’s see recommendation stories for you', style: TextStyle(color: Color(0xFF6D7E97), fontSize: 16)),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage('assets/images/avatar_zee.png'), // TODO: 실제 프로필 이미지
                  ),
                ],
              ),
            ),

            // --- "For you" 추천 게시물 ---
            _buildSectionHeader('For you'),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _featuredPosts.length,
                padding: const EdgeInsets.only(left: 20),
                itemBuilder: (context, index) {
                  final post = _featuredPosts[index];
                  return FeaturedPostCard(post: post, onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => PostDetailScreen(post: post)));
                  });
                },
              ),
            ),

            // --- "Following" 피드 ---
            _buildSectionHeader('Following'),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              itemCount: _followingPosts.length,
              itemBuilder: (context, index) {
                final post = _followingPosts[index];
                return FollowingPostCard(post: post, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PostDetailScreen(post: post)));
                });
              },
              separatorBuilder: (context, index) => const Divider(height: 40, thickness: 1),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}