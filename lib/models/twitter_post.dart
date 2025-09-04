class TwitterPost {
  final String profileImageUrl;
  final String username;
  final String handle;
  final String time;
  final String tweetText;
  final bool isVerified;

  TwitterPost({
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.time,
    required this.tweetText,
    this.isVerified = false,
  });
}

final List<TwitterPost> twitterPosts = [
  TwitterPost(
    profileImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    username: 'Elon Musk',
    handle: 'elonmusk',
    time: '2m',
    tweetText: 'Dogecoin to the moon! 🚀',
    isVerified: true,
  ),
  TwitterPost(
    profileImageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
    username: 'Jane Doe',
    handle: 'jane_doe',
    time: '10m',
    tweetText: 'Just finished a 5k run and feeling great! #fitness',
    isVerified: false,
  ),
  TwitterPost(
    profileImageUrl: 'https://randomuser.me/api/portraits/men/85.jpg',
    username: 'John Appleseed',
    handle: 'johnapple',
    time: '30m',
    tweetText: 'Excited to announce my new project launching next week!',
    isVerified: true,
  ),
  TwitterPost(
    profileImageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
    username: 'Samantha Lee',
    handle: 'samanthalee',
    time: '1h',
    tweetText: 'Coffee and code. That’s my kind of morning ☕💻',
    isVerified: false,
  ),
  TwitterPost(
    profileImageUrl: 'https://randomuser.me/api/portraits/men/41.jpg',
    username: 'Michael Chen',
    handle: 'michaelchen',
    time: '2h',
    tweetText: 'Just landed in Tokyo! Can’t wait to explore the city. 🇯🇵',
    isVerified: false,
  ),
  TwitterPost(
    profileImageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
    username: 'Priya Singh',
    handle: 'priyasingh',
    time: '3h',
    tweetText: 'Reading a new book on Flutter development. Highly recommend it!',
    isVerified: true,
  ),
  TwitterPost(
    profileImageUrl: 'https://randomuser.me/api/portraits/men/77.jpg',
    username: 'Carlos Rivera',
    handle: 'carlosr',
    time: '4h',
    tweetText: 'Had the best tacos ever in Mexico City today! 🌮',
    isVerified: false,
  ),
  TwitterPost(
    profileImageUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
    username: 'Emily Clark',
    handle: 'emilyclark',
    time: '5h',
    tweetText: 'Working on a new art project. Stay tuned for updates!',
    isVerified: false,
  ),
];
