import 'package:flutter/material.dart';

class TwitterPostWidget extends StatefulWidget {
  final String profileImageUrl;
  final String username;
  final String handle;
  final String time;
  final String tweetText;
  final bool isVerified;

  const TwitterPostWidget({
    super.key,
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.time,
    required this.tweetText,
    this.isVerified = false,
  });

  @override
  State<TwitterPostWidget> createState() => _TwitterPostWidgetState();
}

class _TwitterPostWidgetState extends State<TwitterPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      //  Divider(height: 0),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile picture
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(widget.profileImageUrl),
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
                        const SizedBox(width: 6),
                        Text(
                          '@${widget.handle}',
                          style: const TextStyle(
                            color: Color(0xFF536471),
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '· ${widget.time}',
                          style: const TextStyle(
                            color: Color(0xFF536471),
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.grey.shade600,
                          size: 22,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Tweet text
                    Text(
                      widget.tweetText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Engagement buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildEngagementButton(
                          icon: Icons.chat_bubble_outline,
                          count: '165',
                          color: Colors.grey.shade600,
                        ),
                        _buildEngagementButton(
                          icon: Icons.repeat,
                          count: '61',
                          color: Colors.grey.shade600,
                        ),
                        _buildEngagementButton(
                          icon: Icons.favorite_border,
                          count: '538',
                          color: Colors.grey.shade600,
                        ),
                        _buildEngagementButton(
                          icon: Icons.bar_chart,
                          count: '13.1K',
                          color: Colors.grey.shade600,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark_border,
                              color: Colors.grey.shade600,
                              size: 20,
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.share_outlined,
                              color: Colors.grey.shade600,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0),
      ],
    );
  }

  Widget _buildEngagementButton({
    required IconData icon,
    required String count,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(count, style: TextStyle(color: color, fontSize: 14)),
      ],
    );
  }
}

// Example usage in main.dart
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Twitter Post Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: TwitterPostWidget(
//         profileImageUrl: 'https://your-image-url',
//         username: 'Your Name',
//         handle: 'yourhandle',
//         time: '1h',
//         tweetText: 'This is a dynamic tweet!',
//         isVerified: true,
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
