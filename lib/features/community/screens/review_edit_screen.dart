import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/review.dart';
import '../providers/review_provider.dart';

class ReviewEditScreen extends ConsumerStatefulWidget {
  final int index;

  const ReviewEditScreen({super.key, required this.index});

  @override
  ConsumerState<ReviewEditScreen> createState() => _ReviewEditScreenState();
}

class _ReviewEditScreenState extends ConsumerState<ReviewEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    final review = ref.read(reviewListProvider)[widget.index];
    titleController = TextEditingController(text: review.title);
    contentController = TextEditingController(text: review.content);
  }

  @override
  Widget build(BuildContext context) {
    final review = ref.watch(reviewListProvider)[widget.index]; // 항상 최신 상태 반영

    return Scaffold(
      appBar: AppBar(title: const Text('감상문 수정')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: '제목'),
                validator: (val) =>
                val == null || val.isEmpty ? '제목을 입력해주세요' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(labelText: '내용'),
                validator: (val) =>
                val == null || val.isEmpty ? '내용을 입력해주세요' : null,
                maxLines: 5,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updated = Review(
                      title: titleController.text,
                      date: review.date,
                      content: contentController.text,
                    );
                    ref
                        .read(reviewListProvider.notifier)
                        .editReview(widget.index, updated);
                    context.pop();
                  }
                },
                child: const Text('수정 완료'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}