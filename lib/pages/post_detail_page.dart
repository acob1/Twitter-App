import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_app/pages/profile_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:twitter_app/widgets/comment_bottom_sheet.dart';
import 'package:twitter_app/widgets/repost_options_sheet.dart';

// Mock comment model
class CommentModel {
  final String id;
  final String username;
  final String handle;
  final String profileImageUrl;
  final String content;
  final String time;
  final bool isVerified;
  final int likes;
  final int replies;

  CommentModel({
    required this.id,
    required this.username,
    required this.handle,
    required this.profileImageUrl,
    required this.content,
    required this.time,
    this.isVerified = false,
    this.likes = 0,
    this.replies = 0,
  });
}

// Provider for comments - this would normally come from your backend
final commentsProvider = StateProvider.family<List<CommentModel>, String>((ref, tweetId) => [
  CommentModel(
    id: '1',
    username: 'Sarah Johnson',
    handle: 'sarah_j',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
    content: 'This is so true! Thanks for sharing this insight.',
    time: '2h',
    isVerified: true,
    likes: 12,
    replies: 2,
  ),
  CommentModel(
    id: '2',
    username: 'Mike Chen',
    handle: 'mikechen',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
    content: 'Couldn\'t agree more. This really resonates with my experience.',
    time: '4h',
    likes: 5,
    replies: 1,
  ),
  CommentModel(
    id: '3',
    username: 'Emma Wilson',
    handle: 'emma_w',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
    content: 'Great point! I never thought about it this way before. 🤔',
    time: '6h',
    likes: 8,
    replies: 0,
  ),
  CommentModel(
    id: '4',
    username: 'David Kim',
    handle: 'david_k',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/45.jpg',
    content: 'Absolutely! This changed my perspective completely. Thanks for posting this!',
    time: '8h',
    likes: 3,
    replies: 0,
  ),
  CommentModel(
    id: '5',
    username: 'Lisa Martinez',
    handle: 'lisa_m',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/32.jpg',
    content: 'Love this! Can you share more resources on this topic?',
    time: '10h',
    isVerified: true,
    likes: 15,
    replies: 3,
  ),
]);

class PostDetailPage extends ConsumerStatefulWidget {
  final String profileImageUrl;
  final String username;
  final String handle;
  final String time;
  final String tweetText;
  final bool isVerified;
  final String tweetId;

  const PostDetailPage({
    super.key,
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.time,
    required this.tweetText,
    required this.tweetId,
    this.isVerified = false,
  });

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  // Providers for state management
  late final StateProvider<bool> likeProvider;
  late final StateProvider<bool> repostProvider;
  late final StateProvider<int> commentCountProvider;
  late final StateProvider<int> repostCountProvider;
  late final StateProvider<int> likeCountProvider;

  @override
  void initState() {
    super.initState();
    // Initialize providers with unique keys
    likeProvider = StateProvider<bool>((ref) => false);
    repostProvider = StateProvider<bool>((ref) => false);
    commentCountProvider = StateProvider<int>((ref) => 165);
    repostCountProvider = StateProvider<int>((ref) => 61);
    likeCountProvider = StateProvider<int>((ref) => 538);
  }

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final comments = ref.watch(commentsProvider(widget.tweetId));
    final isLiked = ref.watch(likeProvider);
    final isReposted = ref.watch(repostProvider);
    final commentCount = ref.watch(commentCountProvider);
    final repostCount = ref.watch(repostCountProvider);
    final likeCount = ref.watch(likeCountProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Post',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.black),
            onPressed: () => _handleShare(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main post
                  _buildMainPost(),
                  const Divider(height: 1, thickness: 0.5, color: Color(0xFFE1E8ED)),
                  
                  // Engagement stats
                  _buildEngagementStats(commentCount, repostCount, likeCount),
                  const Divider(height: 1, thickness: 0.5, color: Color(0xFFE1E8ED)),
                  
                  // Action buttons
                  _buildActionButtons(isLiked, isReposted),
                  const Divider(height: 8, thickness: 8, color: Color(0xFFF7F9FA)),
                  
                  // Comments section
                  _buildCommentsSection(comments),
                ],
              ),
            ),
          ),
          // Comment input
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildMainPost() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TwitterProfileUI(username: widget.username),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      if (widget.isVerified) ...[
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
                    ],
                  ),
                  Text(
                    '@${widget.handle}',
                    style: const TextStyle(
                      color: Color(0xFF536471),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.more_horiz,
                color: Colors.grey.shade600,
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Tweet text
          Text(
            widget.tweetText,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          
          // Time and date
          Text(
            '${widget.time} · ${_getCurrentDate()}',
            style: const TextStyle(
              color: Color(0xFF536471),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEngagementStats(int comments, int reposts, int likes) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _buildStatItem(_formatCount(reposts), 'Reposts'),
          const SizedBox(width: 20),
          _buildStatItem('12', 'Quote Tweets'),
          const SizedBox(width: 20),
          _buildStatItem(_formatCount(likes), 'Likes'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: count,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: ' $label',
            style: const TextStyle(
              color: Color(0xFF536471),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(bool isLiked, bool isReposted) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildActionButton(
            icon: Icons.chat_bubble_outline,
            color: Colors.grey.shade600,
            onTap: () => _commentFocusNode.requestFocus(),
          ),
          _buildActionButton(
            icon: Icons.repeat,
            color: isReposted ? Colors.green : Colors.grey.shade600,
            onTap: () => _handleRepost(),
          ),
          _buildActionButton(
            icon: isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : Colors.grey.shade600,
            onTap: () => _handleLike(),
          ),
          _buildActionButton(
            icon: Icons.share_outlined,
            color: Colors.grey.shade600,
            onTap: () => _handleShare(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }

  Widget _buildCommentsSection(List<CommentModel> comments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (comments.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              thickness: 0.5,
              color: Color(0xFFE1E8ED),
            ),
            itemBuilder: (context, index) {
              return _buildCommentItem(comments[index]);
            },
          ),
      ],
    );
  }

  Widget _buildCommentItem(CommentModel comment) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(comment.profileImageUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    if (comment.isVerified) ...[
                      const SizedBox(width: 4),
                      Container(
                        width: 14,
                        height: 14,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1DA1F2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ],
                    const SizedBox(width: 6),
                    Text(
                      '@${comment.handle}',
                      style: const TextStyle(
                        color: Color(0xFF536471),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '· ${comment.time}',
                      style: const TextStyle(
                        color: Color(0xFF536471),
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.grey.shade600,
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  comment.content,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildCommentAction(
                      Icons.chat_bubble_outline,
                      comment.replies.toString(),
                    ),
                    const SizedBox(width: 20),
                    _buildCommentAction(
                      Icons.favorite_border,
                      comment.likes.toString(),
                    ),
                    const SizedBox(width: 20),
                    _buildCommentAction(
                      Icons.share_outlined,
                      '',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentAction(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade600, size: 16),
        if (count.isNotEmpty) ...[
          const SizedBox(width: 4),
          Text(
            count,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE1E8ED), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/32.jpg',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _commentController,
              focusNode: _commentFocusNode,
              decoration: const InputDecoration(
                hintText: 'Post your reply',
                hintStyle: TextStyle(
                  color: Color(0xFF536471),
                  fontSize: 16,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              maxLines: null,
              style: const TextStyle(fontSize: 16),
              onChanged: (value) {
                setState(() {}); // Trigger rebuild to update button state
              },
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: _commentController.text.trim().isEmpty
                ? null
                : () => _addComment(),
            style: ElevatedButton.styleFrom(
              backgroundColor: _commentController.text.trim().isEmpty
                  ? Colors.grey[300]
                  : const Color(0xFF1DA1F2),
              foregroundColor: _commentController.text.trim().isEmpty
                  ? Colors.grey[500]
                  : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            child: const Text('Reply'),
          ),
        ],
      ),
    );
  }

  void _addComment() {
    if (_commentController.text.trim().isEmpty) return;

    final newComment = CommentModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      username: 'Danso jacob',
      handle: 'Jlem07',
      profileImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
      content: _commentController.text.trim(),
      time: 'now',
      isVerified: false,
      likes: 0,
      replies: 0,
    );

    // Add comment to the list
    final currentComments = ref.read(commentsProvider(widget.tweetId));
    ref.read(commentsProvider(widget.tweetId).notifier).state = [
      newComment,
      ...currentComments,
    ];

    // Update comment count
    final currentCount = ref.read(commentCountProvider);
    ref.read(commentCountProvider.notifier).state = currentCount + 1;

    // Clear the input
    _commentController.clear();
    _commentFocusNode.unfocus();

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Reply posted!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleLike() {
    final isLiked = ref.read(likeProvider);
    final currentCount = ref.read(likeCountProvider);
    
    ref.read(likeProvider.notifier).state = !isLiked;
    ref.read(likeCountProvider.notifier).state = 
        isLiked ? currentCount - 1 : currentCount + 1;
  }

  void _handleRepost() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => RepostOptionsSheet(
        profileImageUrl: widget.profileImageUrl,
        username: widget.username,
        handle: widget.handle,
        time: widget.time,
        tweetText: widget.tweetText,
        onRepost: () {
          final isReposted = ref.read(repostProvider);
          final currentCount = ref.read(repostCountProvider);
          
          ref.read(repostProvider.notifier).state = !isReposted;
          ref.read(repostCountProvider.notifier).state = 
              isReposted ? currentCount - 1 : currentCount + 1;
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(isReposted ? 'Repost undone' : 'Reposted!'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        onQuoteRepost: () {
          // Handle quote repost - you can implement this based on your needs
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Quote repost feature coming soon!')),
          );
        },
      ),
    );
  }

  void _handleShare() {
    final shareText = '${widget.tweetText}\n\n- @${widget.handle}';
    Share.share(
      shareText,
      subject: 'Check out this tweet from @${widget.handle}',
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

  String _getCurrentDate() {
    final now = DateTime.now();
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[now.month - 1]} ${now.day}, ${now.year}';
  }
}