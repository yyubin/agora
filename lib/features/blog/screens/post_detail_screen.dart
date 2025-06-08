import 'package:agora_flutter/core/models/post_model.dart';
import 'package:agora_flutter/features/blog/widgets/comment_bottom_sheet.dart';
import 'package:agora_flutter/features/user/screens/author_profile_screen.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  final Post post;
  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool _bookmarked = false;
  final _fakeInput = TextEditingController();

  void _toggleBookmark() {
    setState(() => _bookmarked = !_bookmarked);
    // TODO: 실제 북마크 API 호출
  }

  void _openComments() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const CommentBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            leading: const BackButton(color: Colors.white),
            actions: [
              IconButton(
                icon: Icon(_bookmarked ? Icons.bookmark : Icons.bookmark_border),
                onPressed: _toggleBookmark,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                post.imageUrl,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.3),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(post.author.avatarUrl),
                    ),
                    title: Text(post.author.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text(post.category,
                        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AuthorProfileScreen(author: post.author),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(post.title,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1.45)),
                  const SizedBox(height: 20),
                  Text(
                    '${post.content}\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
                    style: const TextStyle(color: Color(0xFF6D7E97), fontSize: 16, height: 1.62),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: InkWell(
            onTap: _openComments,
            child: IgnorePointer(
              child: TextField(
                controller: _fakeInput,
                decoration: InputDecoration(
                  hintText: 'Add a comment...',
                  suffixIcon: const Icon(Icons.messenger_outline),
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
          ),
        ),
      ),
    );
  }
}
