import 'package:flutter/material.dart';
import 'package:twitter_app/widgets/post_widget.dart';

class TabSwitcher extends StatefulWidget {
  const TabSwitcher({super.key});

  @override
  _TabSwitcherState createState() => _TabSwitcherState();
}

class _TabSwitcherState extends State<TabSwitcher> {
  int selectedIndex = 0;

  final List<Widget> _tabPages = [ForYouTab(), FollowingTab()];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "For you",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == 0
                              ? Colors.black
                              : Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        height: 3,
                        width: 60,
                        decoration: BoxDecoration(
                          color: selectedIndex == 0
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Following",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == 1
                              ? Colors.black
                              : Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        height: 3,
                        width: 60,
                        decoration: BoxDecoration(
                          color: selectedIndex == 1
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Show the selected tab's page below the toggle
        _tabPages[selectedIndex],
      ],
    );
  }
}

class ForYouTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
          username: 'Elon Musk',
          handle: 'elonmusk',
          time: '2m',
          tweetText: 'Dogecoin to the moon! 🚀',
          isVerified: true,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
          username: 'Jane Doe',
          handle: 'jane_doe',
          time: '10m',
          tweetText: 'Just finished a 5k run and feeling great! #fitness',
          isVerified: false,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/men/85.jpg',
          username: 'John Appleseed',
          handle: 'johnapple',
          time: '30m',
          tweetText: 'Excited to announce my new project launching next week!',
          isVerified: true,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
          username: 'Samantha Lee',
          handle: 'samanthalee',
          time: '1h',
          tweetText: 'Coffee and code. That’s my kind of morning ☕💻',
          isVerified: false,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/men/41.jpg',
          username: 'Michael Chen',
          handle: 'michaelchen',
          time: '2h',
          tweetText:
              'Just landed in Tokyo! Can’t wait to explore the city. 🇯🇵',
          isVerified: false,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
          username: 'Priya Singh',
          handle: 'priyasingh',
          time: '3h',
          tweetText:
              'Reading a new book on Flutter development. Highly recommend it!',
          isVerified: true,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/men/77.jpg',
          username: 'Carlos Rivera',
          handle: 'carlosr',
          time: '4h',
          tweetText: 'Had the best tacos ever in Mexico City today! 🌮',
          isVerified: false,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
          username: 'Emily Clark',
          handle: 'emilyclark',
          time: '5h',
          tweetText: 'Working on a new art project. Stay tuned for updates!',
          isVerified: false,
        ),
      ],
    );
  }
}

class FollowingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
          username: 'Elon Musk',
          handle: 'weeee',
          time: '2m',
          tweetText: 'Dogecoin to the moon! 🚀',
          isVerified: true,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
          username: 'Jane Doe',
          handle: 'jane_doe',
          time: '10m',
          tweetText: 'Just finished a 5k run and feeling great! #fitness',
          isVerified: false,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/men/85.jpg',
          username: 'John Appleseed',
          handle: 'johnapple',
          time: '30m',
          tweetText: 'Excited to announce my new project launching next week!',
          isVerified: true,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
          username: 'Samantha Lee',
          handle: 'samanthalee',
          time: '1h',
          tweetText: 'Coffee and code. That’s my kind of morning ☕💻',
          isVerified: false,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/men/41.jpg',
          username: 'Michael Chen',
          handle: 'michaelchen',
          time: '2h',
          tweetText:
              'Just landed in Tokyo! Can’t wait to explore the city. 🇯🇵',
          isVerified: false,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
          username: 'Priya Singh',
          handle: 'priyasingh',
          time: '3h',
          tweetText:
              'Reading a new book on Flutter development. Highly recommend it!',
          isVerified: true,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/men/77.jpg',
          username: 'Carlos Rivera',
          handle: 'carlosr',
          time: '4h',
          tweetText: 'Had the best tacos ever in Mexico City today! 🌮',
          isVerified: false,
        ),
        TwitterPostWidget(
          profileImageUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
          username: 'Emily Clark',
          handle: 'emilyclark',
          time: '5h',
          tweetText: 'Working on a new art project. Stay tuned for updates!',
          isVerified: false,
        ),
      ],
    );
  }
}
