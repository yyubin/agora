import 'package:agora_flutter/core/models/post_model.dart';
import 'package:flutter/material.dart';

class TrendingPostTile extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;

  const TrendingPostTile({super.key, required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              post.imageUrl,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.author.name,
                  style: const TextStyle(color: Color(0xFF6D7E97), fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  post.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  post.timestamp,
                  style: const TextStyle(color: Color(0xFF6D7E97), fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}