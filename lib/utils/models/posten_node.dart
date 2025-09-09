class PostEngagement {
  final int replies;
  final int reposts;
  final int likes;
  final int views;
  final bool isLiked;
  final bool isReposted;

  PostEngagement({
    required this.replies,
    required this.reposts,
    required this.likes,
    required this.views,
    this.isLiked = false,
    this.isReposted = false,
  });

  PostEngagement copyWith({
    int? replies,
    int? reposts,
    int? likes,
    int? views,
    bool? isLiked,
    bool? isReposted,
  }) {
    return PostEngagement(
      replies: replies ?? this.replies,
      reposts: reposts ?? this.reposts,
      likes: likes ?? this.likes,
      views: views ?? this.views,
      isLiked: isLiked ?? this.isLiked,
      isReposted: isReposted ?? this.isReposted,
    );
  }
}
