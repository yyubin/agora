import 'package:agora_flutter/core/models/author_model.dart';

class Comment {
  final String id;
  final Author author;
  final String text;
  final String timestamp;

  Comment({
    required this.id,
    required this.author,
    required this.text,
    required this.timestamp,
  });
}