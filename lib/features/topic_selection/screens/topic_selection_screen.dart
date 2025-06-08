import 'package:agora_flutter/features/topic_selection/screens/follow_contributors_screen.dart';
import 'package:agora_flutter/features/topic_selection/widgets/topic_chip.dart';
import 'package:flutter/material.dart';

class TopicSelectionScreen extends StatefulWidget {
  const TopicSelectionScreen({super.key});

  @override
  State<TopicSelectionScreen> createState() => _TopicSelectionScreenState();
}

class _TopicSelectionScreenState extends State<TopicSelectionScreen> {
  final List<String> _allTopics = [
    'Game', 'Design', 'Health', 'Entertainment', 'Music', 'Graphic',
    'Tech', '3d', 'Writing', 'News', 'Business', 'Sports', 'Fashion',
    'Technology', 'UI Design', 'UX Design', 'Motion', 'Video', 'Food',
    'Fun', 'Entertenment', 'Creative'
  ];
  final Set<String> _selectedTopics = {};

  @override
  Widget build(BuildContext context) {
    final bool canContinue = _selectedTopics.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // TODO: 홈 화면으로 바로 이동하는 로직 구현
            },
            child: const Text('Skip', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Topic, \nStart Reading',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 12.0, // 가로 간격
                  runSpacing: 12.0, // 세로 간격
                  children: _allTopics.map((topic) {
                    return TopicChip(
                      label: topic,
                      isSelected: _selectedTopics.contains(topic),
                      onTap: () {
                        setState(() {
                          if (_selectedTopics.contains(topic)) {
                            _selectedTopics.remove(topic);
                          } else {
                            _selectedTopics.add(topic);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: canContinue
                    ? () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const FollowContributorsScreen()));
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: canContinue
                      ? const Color(0xFF3076E0)
                      : const Color(0x7F3076E0),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}