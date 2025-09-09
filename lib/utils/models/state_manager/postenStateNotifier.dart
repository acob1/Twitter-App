import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_app/utils/models/posten_node.dart';

class EngagementNotifier extends StateNotifier<PostEngagement> {
  EngagementNotifier()
      : super(PostEngagement(replies: 165, reposts: 61, likes: 538, views: 13100));

  void toggleLike() {
    if (state.isLiked) {
      state = state.copyWith(isLiked: false, likes: state.likes - 1);
    } else {
      state = state.copyWith(isLiked: true, likes: state.likes + 1);
    }
  }

  void toggleRepost() {
    if (state.isReposted) {
      state = state.copyWith(isReposted: false, reposts: state.reposts - 1);
    } else {
      state = state.copyWith(isReposted: true, reposts: state.reposts + 1);
    }
  }

  void addReply() {
    state = state.copyWith(replies: state.replies + 1);
  }

  void addShare() {
    // In real apps, open share sheet, but we can just log for now
    print("Shared post");
  }
}

final engagementProvider =
    StateNotifierProvider<EngagementNotifier, PostEngagement>(
  (ref) => EngagementNotifier(),
);
