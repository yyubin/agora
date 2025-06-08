import 'package:agora_flutter/core/models/author_model.dart';

class Post {
  final String id;
  final String title;
  final String subtitle;
  final String content;
  final String imageUrl;
  final Author author;
  final String category;
  final String readTime;
  final String timestamp;

  Post({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.category,
    required this.readTime,
    required this.timestamp,
  });
}