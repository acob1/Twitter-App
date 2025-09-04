// User model with posts
class UserModel {
  final String id;
  final String profileImageUrl;
  final String username;
  final String handle;
  final String bio;
  final int followers;
  final int following;
  final List<PostModel> posts;

  UserModel({
    required this.id,
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.bio,
    required this.followers,
    required this.following,
    required this.posts,
  });
}

// Post model
class PostModel {
  final String id;
  final String content;
  final String time;
  final bool isVerified;

  PostModel({
    required this.id,
    required this.content,
    required this.time,
    this.isVerified = false,
  });
}

// Example users with posts
final List<UserModel> users = [
  UserModel(
    id: '1',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    username: 'Danso jacob',
    handle: '@Jlem07',
    bio: 'Flutter developer | Tech enthusiast | Coffee lover',
    followers: 1200,
    following: 350,
    posts: [
      PostModel(id: 'p1', content: 'Hello Twitter!', time: '2m'),
      PostModel(id: 'p2', content: 'Building a Flutter app!', time: '10m'),
    ],
  ),
  UserModel(
    id: '2',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
    username: 'Jane Doe',
    handle: '@janedoe',
    bio: 'Runner | Designer | Dreamer',
    followers: 800,
    following: 410,
    posts: [
      PostModel(id: 'p3', content: 'Just finished a 5k run!', time: '30m'),
    ],
  ),
  UserModel(
    id: '3',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/85.jpg',
    username: 'John Appleseed',
    handle: '@johnapple',
    bio: 'Entrepreneur | Traveler',
    followers: 2000,
    following: 500,
    posts: [
      PostModel(id: 'p4', content: 'Excited to announce my new project launching next week!', time: '1h'),
    ],
  ),
  UserModel(
    id: '4',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
    username: 'Samantha Lee',
    handle: '@samanthalee',
    bio: 'Coffee and code. That’s my kind of morning ☕💻',
    followers: 950,
    following: 300,
    posts: [
      PostModel(id: 'p5', content: 'Working on a new art project. Stay tuned for updates!', time: '2h'),
    ],
  ),
  UserModel(
    id: '5',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/41.jpg',
    username: 'Michael Chen',
    handle: '@michaelchen',
    bio: 'Globetrotter | Foodie',
    followers: 1100,
    following: 420,
    posts: [
      PostModel(id: 'p6', content: 'Just landed in Tokyo! Can’t wait to explore the city. 🇯🇵', time: '3h'),
    ],
  ),
  UserModel(
    id: '6',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
    username: 'Priya Singh',
    handle: '@priyasingh',
    bio: 'Flutter dev | Bookworm',
    followers: 1300,
    following: 390,
    posts: [
      PostModel(id: 'p7', content: 'Reading a new book on Flutter development. Highly recommend it!', time: '4h'),
    ],
  ),
  UserModel(
    id: '7',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/77.jpg',
    username: 'Carlos Rivera',
    handle: '@carlosr',
    bio: 'Taco lover | Traveler',
    followers: 700,
    following: 210,
    posts: [
      PostModel(id: 'p8', content: 'Had the best tacos ever in Mexico City today! 🌮', time: '5h'),
    ],
  ),
  UserModel(
    id: '8',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
    username: 'Emily Clark',
    handle: '@emilyclark',
    bio: 'Artist | Dreamer',
    followers: 600,
    following: 180,
    posts: [
      PostModel(id: 'p9', content: 'Working on a new art project. Stay tuned for updates!', time: '6h'),
    ],
  ),
];
