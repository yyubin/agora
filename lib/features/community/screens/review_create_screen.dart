import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/review.dart';
import '../providers/review_provider.dart';

class ReviewCreateScreen extends ConsumerStatefulWidget {
  const ReviewCreateScreen({super.key});

  @override
  ConsumerState<ReviewCreateScreen> createState() => _ReviewCreateScreenState();
}

class _ReviewCreateScreenState extends ConsumerState<ReviewCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String content = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newReview = Review(
        title: title,
        date: DateTime.now().toString().substring(0, 10),
        content: content,
      );

      ref.read(reviewListProvider.notifier).addReview(newReview);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('감상문이 등록되었습니다!')),
      );

      context.pop(); // go_router 방식
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('감상문 작성')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: '제목'),
                onSaved: (val) => title = val ?? '',
                validator: (val) =>
                val == null || val.isEmpty ? '제목을 입력해주세요' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: '내용'),
                onSaved: (val) => content = val ?? '',
                validator: (val) =>
                val == null || val.isEmpty ? '내용을 입력해주세요' : null,
                maxLines: 5,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('작성 완료'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
