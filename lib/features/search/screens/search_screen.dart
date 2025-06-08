import 'package:agora_flutter/core/models/author_model.dart';
import 'package:agora_flutter/core/models/post_model.dart';
import 'package:agora_flutter/features/blog/screens/post_detail_screen.dart';
import 'package:agora_flutter/features/search/widgets/search_result_tile.dart';
import 'package:agora_flutter/features/topic_selection/widgets/topic_chip.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _hasSearched = false;
  List<Post> _searchResults = [];

  // 추천 토픽 샘플 데이터
  final List<String> _suggestionTopics = [
    'Game', 'Design', 'Health', 'Entertainment', 'Music', 'Graphic',
    'Tech', '3d', 'Writing', 'News',
  ];

  // 검색 로직 시뮬레이션
  void _performSearch(String query) {
    setState(() {
      _hasSearched = true;
      if (query.isEmpty) {
        _searchResults = [];
        return;
      }
      // 실제로는 여기서 API를 호출하여 검색 결과를 가져옵니다.
      // 지금은 샘플 데이터로 대체합니다.
      _searchResults = [
        Post(id: '20', title: 'Organic Food', subtitle: 'There is ipsum dot am', imageUrl: 'assets/images/search1.png', author: Author(name: 'Jonas Smith', avatarUrl: ''), category: 'Food / Recipe', readTime: '', timestamp: '', content: ''),
        Post(id: '21', title: 'Learned Beauty', subtitle: 'There is ipsum dot am', imageUrl: 'assets/images/search2.png', author: Author(name: 'Jonas Smith', avatarUrl: ''), category: 'Beauty / fashion', readTime: '', timestamp: '', content: ''),
      ];
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 검색 입력 필드 ---
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search your topic',
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onSubmitted: _performSearch,
            ),
            const SizedBox(height: 24),

            // --- 검색 전/후 UI 전환 ---
            Expanded(
              child: _hasSearched
                  ? _buildSearchResults()
                  : _buildSearchSuggestions(),
            ),
          ],
        ),
      ),
    );
  }

  // 검색 전: 추천 토픽을 보여주는 위젯
  Widget _buildSearchSuggestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Search..',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          children: _suggestionTopics.map((topic) {
            return TopicChip(
              label: topic,
              isSelected: false, // 선택 기능이 필요하다면 State로 관리
              onTap: () {
                _searchController.text = topic;
                _performSearch(topic);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  // 검색 후: 결과 목록을 보여주는 위젯
  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return const Center(child: Text('No results found.'));
    }
    return ListView.separated(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final post = _searchResults[index];
        return SearchResultTile(
          post: post,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => PostDetailScreen(post: post)));
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(height: 32),
    );
  }
}