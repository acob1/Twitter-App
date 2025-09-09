// Comment Bottom Sheet Widget
import 'package:flutter/material.dart';

class CommentBottomSheet extends StatefulWidget {
  final String profileImageUrl;
  final String username;
  final String handle;
  final String time;
  final String tweetText;
  final VoidCallback onCommentAdded;

  const CommentBottomSheet({
    Key? key,
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.time,
    required this.tweetText,
    required this.onCommentAdded,
  }) : super(key: key);

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const Spacer(),
                const Text(
                  'Reply',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: _commentController.text.trim().isEmpty
                      ? null
                      : () => _postComment(),
                  child: Text(
                    'Reply',
                    style: TextStyle(
                      color: _commentController.text.trim().isEmpty
                          ? Colors.grey
                          : const Color(0xFF1DA1F2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          // Original tweet
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '@${widget.handle}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '· ${widget.time}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.tweetText,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Replying to @${widget.handle}',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Comment input section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    focusNode: _focusNode,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Tweet your reply',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    style: const TextStyle(fontSize: 18),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _postComment() {
    if (_commentController.text.trim().isEmpty) return;

    widget.onCommentAdded();
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Reply posted!'),
        duration: Duration(seconds: 2),
      ),
    );

    Navigator.pop(context);
  }
}

// Repost Options Sheet
class RepostOptionsSheet extends StatelessWidget {
  final String profileImageUrl;
  final String username;
  final String handle;
  final String time;
  final String tweetText;
  final VoidCallback onRepost;
  final VoidCallback onQuoteRepost;

  const RepostOptionsSheet({
    Key? key,
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.time,
    required this.tweetText,
    required this.onRepost,
    required this.onQuoteRepost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.repeat, color: Colors.green, size: 24),
            title: const Text('Repost', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              Navigator.pop(context);
              onRepost();
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.grey, size: 24),
            title: const Text('Quote', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              Navigator.pop(context);
              onQuoteRepost();
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

