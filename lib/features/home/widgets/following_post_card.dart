import 'package:agora_flutter/core/models/post_model.dart';
import 'package:flutter/material.dart';

class FollowingPostCard extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;

  const FollowingPostCard({super.key, required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(post.author.avatarUrl),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.author.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                  Text(post.category, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(post.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(
            post.subtitle,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF6D7E97), fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            'Read Time : ${post.readTime}',
            style: const TextStyle(color: Color(0xFF3177E0), fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}