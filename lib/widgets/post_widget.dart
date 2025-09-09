import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_app/pages/post_detail_page.dart';
import 'package:twitter_app/pages/profile_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:twitter_app/widgets/comment_bottom_sheet.dart';
import 'package:twitter_app/widgets/repost_options_sheet.dart';
import 'package:twitter_app/widgets/twitterLikeBu.dart';

class TwitterPostWidget extends ConsumerWidget {
  final String profileImageUrl;
  final String username;
  final String handle;
  final String time;
  final String tweetText;
  final bool isVerified;
  final String tweetId;

  TwitterPostWidget({
    super.key,
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.time,
    required this.tweetText,
    required this.tweetId,
    this.isVerified = false,
  });

  // Providers for state management
  final likeProvider = StateProvider.family<bool, String>((ref, tweetId) => false);
  final repostProvider = StateProvider.family<bool, String>((ref, tweetId) => false);
  final commentCountProvider = StateProvider.family<int, String>((ref, tweetId) => 165);
  final repostCountProvider = StateProvider.family<int, String>((ref, tweetId) => 61);
  final likeCountProvider = StateProvider.family<int, String>((ref, tweetId) => 538);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider states
    final isLiked = ref.watch(likeProvider(tweetId));
    final isReposted = ref.watch(repostProvider(tweetId));
    final commentCount = ref.watch(commentCountProvider(tweetId));
    final repostCount = ref.watch(repostCountProvider(tweetId));
    final likeCount = ref.watch(likeCountProvider(tweetId));

    return Column(
      children: [
        // Wrap the entire post in GestureDetector to make it clickable
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailPage(
                  profileImageUrl: profileImageUrl,
                  username: username,
                  handle: handle,
                  time: time,
                  tweetText: tweetText,
                  isVerified: isVerified,
                  tweetId: tweetId,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile picture (prevent tap from propagating to post tap)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TwitterProfileUI(username: username),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                ),
                const SizedBox(width: 12),
                // Main content: header, tweet, engagement
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header row
                      Row(
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          if (isVerified) ...[
                            const SizedBox(width: 4),
                            Container(
                              width: 16,
                              height: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1DA1F2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ],
                          const SizedBox(width: 6),
                          Text(
                            '@$handle',
                            style: const TextStyle(
                              color: Color(0xFF536471),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '· $time',
                            style: const TextStyle(
                              color: Color(0xFF536471),
                              fontSize: 15,
                            ),
                          ),
                          const Spacer(),
                          // Prevent more button tap from opening post detail
                          GestureDetector(
                            onTap: () {
                              // Handle more options here
                              _showMoreOptions(context);
                            },
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.grey.shade600,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Tweet text
                      Text(
                        tweetText,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Engagement buttons - prevent tap propagation
                      GestureDetector(
                        onTap: () {}, // Prevent tap propagation
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildEngagementButton(
                              icon: Icons.chat_bubble_outline,
                              count: _formatCount(commentCount),
                              color: Colors.grey.shade600,
                              onTap: () => _showCommentSheet(context, ref),
                            ),
                            _buildEngagementButton(
                              icon: Icons.repeat,
                              count: _formatCount(repostCount),
                              color: isReposted ? Colors.green : Colors.grey.shade600,
                              onTap: () => _handleRepost(context, ref),
                            ),
                            // Special like button with animation
                            TwitterLikeButton(
                              isLiked: isLiked,
                              count: _formatCount(likeCount),
                              onTap: () => _handleLike(ref),
                            ),
                            _buildEngagementButton(
                              icon: Icons.bar_chart,
                              count: '13.1K',
                              color: Colors.grey.shade600,
                              onTap: () {},
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Tweet bookmarked!')),
                                    );
                                  },
                                  child: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.grey.shade600,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                GestureDetector(
                                  onTap: () => _handleShare(context),
                                  child: Icon(
                                    Icons.share_outlined,
                                    color: Colors.grey.shade600,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 1, thickness: 0.5, color: Color(0xFFE1E8ED)),
      ],
    );
  }

  Widget _buildEngagementButton({
    required IconData icon,
    required String count,
    required Color color,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(count, style: TextStyle(color: color, fontSize: 14)),
        ],
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }

  void _handleLike(WidgetRef ref) {
    final isLiked = ref.read(likeProvider(tweetId));
    final currentCount = ref.read(likeCountProvider(tweetId));
    
    ref.read(likeProvider(tweetId).notifier).state = !isLiked;
    ref.read(likeCountProvider(tweetId).notifier).state = 
        isLiked ? currentCount - 1 : currentCount + 1;
  }

  void _handleRepost(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => RepostOptionsSheet(
        profileImageUrl: profileImageUrl,
        username: username,
        handle: handle,
        time: time,
        tweetText: tweetText,
        onRepost: () {
          final isReposted = ref.read(repostProvider(tweetId));
          final currentCount = ref.read(repostCountProvider(tweetId));
          
          ref.read(repostProvider(tweetId).notifier).state = !isReposted;
          ref.read(repostCountProvider(tweetId).notifier).state = 
              isReposted ? currentCount - 1 : currentCount + 1;
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(isReposted ? 'Repost undone' : 'Reposted!'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        onQuoteRepost: () {
          _showQuoteRepostSheet(context, ref);
        },
      ),
    );
  }

  void _handleShare(BuildContext context) {
    final shareText = '$tweetText\n\n- @$handle';
    Share.share(
      shareText,
      subject: 'Check out this tweet from @$handle',
    );
  }

  void _showCommentSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CommentBottomSheet(
        profileImageUrl: profileImageUrl,
        username: username,
        handle: handle,
        time: time,
        tweetText: tweetText,
        onCommentAdded: () {
          final currentCount = ref.read(commentCountProvider(tweetId));
          ref.read(commentCountProvider(tweetId).notifier).state = currentCount + 1;
        },
      ),
    );
  }

  void _showQuoteRepostSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QuoteRepostSheet(
        profileImageUrl: profileImageUrl,
        username: username,
        handle: handle,
        time: time,
        tweetText: tweetText,
        onQuotePosted: () {
          final currentCount = ref.read(repostCountProvider(tweetId));
          ref.read(repostCountProvider(tweetId).notifier).state = currentCount + 1;
        },
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.person_off_outlined),
              title: const Text('Not interested in this post'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('We\'ll show you fewer posts like this')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_remove_outlined),
              title: Text('Unfollow @$handle'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Unfollowed @$handle')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.volume_off_outlined),
              title: Text('Mute @$handle'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Muted @$handle')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.block_outlined),
              title: Text('Block @$handle'),
              onTap: () {
                Navigator.pop(context);
                _showBlockConfirmation(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.flag_outlined),
              title: const Text('Report post'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Post reported')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showBlockConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Block @$handle?'),
        content: Text('They will not be able to follow you or view your posts, and you will not see posts or notifications from @$handle.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Blocked @$handle')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Block'),
          ),
        ],
      ),
    );
  }
}

