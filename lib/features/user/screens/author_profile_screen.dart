import 'package:agora_flutter/core/models/author_model.dart';
import 'package:agora_flutter/core/models/post_model.dart';
import 'package:agora_flutter/features/blog/screens/post_detail_screen.dart';
import 'package:agora_flutter/features/home/widgets/trending_post_tile.dart';
import 'package:flutter/material.dart';

class AuthorProfileScreen extends StatelessWidget {
  final Author author;

  const AuthorProfileScreen({super.key, required this.author});

  // 샘플 데이터: 특정 작가가 쓴 글 목록 (나중에 API로 대체)
  static final List<Post> _authorPosts = [
    Post(id: '10', title: 'Content Creator jobs', subtitle: '...', imageUrl: 'assets/images/post3.png', author: Author(name: 'Melinda Deshina', avatarUrl: ''), category: 'Writing', readTime: '3 min', timestamp: '6 hours ago', content: ''),
    Post(id: '11', title: 'Organic Food is Better', subtitle: '...', imageUrl: 'assets/images/post4.png', author: Author(name: 'Melinda Deshina', avatarUrl: ''), category: 'Food', readTime: '8 min', timestamp: '10 hours ago', content: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: BackButton(color: Colors.grey.shade800),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- 프로필 헤더 ---
            _buildProfileHeader(context),
            const SizedBox(height: 30),

            // --- 이 작가가 쓴 글 목록 ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Posts From ${author.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _authorPosts.length,
                    itemBuilder: (context, index) {
                      final post = _authorPosts[index];
                      return TrendingPostTile(
                        post: post,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PostDetailScreen(post: post)));
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(height: 32),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 프로필 헤더 부분을 만드는 위젯
  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 46,
          backgroundImage: AssetImage(author.avatarUrl),
        ),
        const SizedBox(height: 16),
        Text(author.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Text('Content Creator', style: TextStyle(color: Colors.grey.shade600, fontSize: 14)), // 직업은 샘플
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () { /* TODO: 팔로우 로직 구현 */ },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3076E0),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Follow'),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatColumn('23k', 'Followers'),
            _buildStatColumn('10', 'Following'),
            _buildStatColumn('3', 'Posts'),
          ],
        ),
      ],
    );
  }

  // 팔로워, 팔로잉, 포스트 수를 보여주는 위젯
  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14, color: Color(0xFF6D7E97))),
      ],
    );
  }
}