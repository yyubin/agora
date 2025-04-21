import 'package:flutter_riverpod/flutter_riverpod.dart';

/// key = 리뷰 index(혹은 id), value = liked 여부
final likesProvider =
StateNotifierProvider<LikesNotifier, Map<int, bool>>((ref) {
  return LikesNotifier();
});

class LikesNotifier extends StateNotifier<Map<int, bool>> {
  LikesNotifier() : super({});

  void toggle(int index) {
    final current = state[index] ?? false;
    state = {...state, index: !current};
  }
}
