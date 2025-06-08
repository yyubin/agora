import 'package:agora_flutter/features/main_navigation/main_screen.dart';
import 'package:agora_flutter/features/topic_selection/widgets/contributor_tile.dart';
import 'package:flutter/material.dart';

class Contributor {
  final String id;
  final String name;
  final String job;
  final String avatarUrl;

  Contributor({
    required this.id,
    required this.name,
    required this.job,
    required this.avatarUrl,
  });
}

class FollowContributorsScreen extends StatefulWidget {
  const FollowContributorsScreen({super.key});

  @override
  State<FollowContributorsScreen> createState() =>
      _FollowContributorsScreenState();
}

class _FollowContributorsScreenState extends State<FollowContributorsScreen> {
  final List<Contributor> _contributors = [
    Contributor(id: '1', name: 'Andrew Rash', job: 'Designer', avatarUrl: 'https://placehold.co/56x56/E63946/fff'),
    Contributor(id: '2', name: 'Kamayel Alpha', job: 'Travel Enthusiast', avatarUrl: 'https://placehold.co/56x56/F4A261/fff'),
    Contributor(id: '3', name: 'Supri Richard', job: 'Artist', avatarUrl: 'https://placehold.co/56x56/2A9D8F/fff'),
    Contributor(id: '4', name: 'Bebby Bala Bala', job: 'Software Engineer', avatarUrl: 'https://placehold.co/56x56/264653/fff'),
    Contributor(id: '5', name: 'Kavin Ardana', job: 'Food Blogger', avatarUrl: 'https://placehold.co/56x56/A8DADC/000'),
    Contributor(id: '6', name: 'Melinda Deshina', job: 'Content Creator', avatarUrl: 'https://placehold.co/56x56/457B9D/fff'),
  ];
  final Set<String> _followedIds = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.grey.shade800),
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
              'Follow Contributors',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            const Text(
              'Follow to see what’s their share',
              style: TextStyle(color: Color(0xFF6D7E97), fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _contributors.length,
                itemBuilder: (context, index) {
                  final contributor = _contributors[index];
                  return ContributorTile(
                    name: contributor.name,
                    job: contributor.job,
                    avatarUrl: contributor.avatarUrl,
                    isFollowed: _followedIds.contains(contributor.id),
                    onFollowTap: () {
                      setState(() {
                        if (_followedIds.contains(contributor.id)) {
                          _followedIds.remove(contributor.id);
                        } else {
                          _followedIds.add(contributor.id);
                        }
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: 홈 화면으로 이동하는 로직 구현
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                        (Route<dynamic> route) => false, // 모든 이전 라우트를 false(제거) 처리
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3076E0),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Done',
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