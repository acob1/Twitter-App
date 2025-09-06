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
  // X-style additions
  final String? coverImageUrl;
  final bool isVerified;
  final String? location;
  final String? joinDate;

  UserModel({
    required this.id,
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.bio,
    required this.followers,
    required this.following,
    required this.posts,
    this.coverImageUrl,
    this.isVerified = false,
    this.location,
    this.joinDate,
  });

  get website => null;
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
      PostModel(id: 'p1', content: 'Hello Twitter!', time: '2m', isVerified: true),
      PostModel(id: 'p2', content: 'Building a Flutter app!', time: '10m'),
    ],
    coverImageUrl: 'https://cdn.pixabay.com/photo/2025/08/02/15/43/collared-macaw-9750855_1280.jpg',
    isVerified: true,
    location: 'Accra, Ghana',
    joinDate: 'Jan 2020',
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
    coverImageUrl: 'https://cdn.pixabay.com/photo/2025/08/17/07/43/tractor-9779346_1280.jpg',
    isVerified: false,
    location: 'London, UK',
    joinDate: 'Feb 2019',
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
    coverImageUrl: 'https://cdn.pixabay.com/photo/2025/08/23/15/54/gummy-bear-9792290_1280.jpg',
    isVerified: true,
    location: 'San Francisco, USA',
    joinDate: 'Mar 2018',
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
    coverImageUrl: 'https://cdn.pixabay.com/photo/2025/08/21/13/58/grassland-9787999_1280.jpg',
    isVerified: false,
    location: 'Toronto, Canada',
    joinDate: 'Apr 2021',
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
    coverImageUrl: 'https://cdn.pixabay.com/photo/2025/08/04/21/21/travel-9755525_1280.jpg',
    isVerified: true,
    location: 'Beijing, China',
    joinDate: 'May 2017',
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
    coverImageUrl: 'https://cdn.pixabay.com/photo/2025/06/26/16/05/building-9682225_1280.jpg',
    isVerified: false,
    location: 'Mumbai, India',
    joinDate: 'Jun 2022',
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
    coverImageUrl: 'https://cdn.pixabay.com/photo/2022/10/23/13/43/lake-7541307_1280.jpg',
    isVerified: true,
    location: 'Mexico City, Mexico',
    joinDate: 'Jul 2020',
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
    coverImageUrl: 'https://cdn.pixabay.com/photo/2025/08/13/13/02/landscape-9772229_1280.jpg',
    isVerified: false,
    location: 'Sydney, Australia',
    joinDate: 'Aug 2021',
  ),
];
