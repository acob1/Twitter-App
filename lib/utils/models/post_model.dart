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
    handle: 'Jlem07',
    bio: 'Flutter developer | Tech enthusiast | Coffee lover',
    followers: 1200,
    following: 350,
    posts: [
      PostModel(
        id: 'p1',
        content: 'Hello Twitter!',
        time: '2m',
        isVerified: true,
      ),
      PostModel(id: 'p2', content: 'Building a Flutter app!', time: '10m'),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/08/02/15/43/collared-macaw-9750855_1280.jpg',
    isVerified: true,
    location: 'Accra, Ghana',
    joinDate: 'Jan 2020',
  ),
  UserModel(
    id: '2',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
    username: 'Jane Doe',
    handle: 'janedoe',
    bio: 'Runner | Designer | Dreamer',
    followers: 800,
    following: 410,
    posts: [
      PostModel(id: 'p3', content: 'Just finished a 5k run!', time: '30m'),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/08/17/07/43/tractor-9779346_1280.jpg',
    isVerified: false,
    location: 'London, UK',
    joinDate: 'Feb 2019',
  ),
  UserModel(
    id: '3',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/85.jpg',
    username: 'John Appleseed',
    handle: 'johnapple',
    bio: 'Entrepreneur | Traveler',
    followers: 2000,
    following: 500,
    posts: [
      PostModel(
        id: 'p4',
        content: 'Excited to announce my new project launching next week!',
        time: '1h',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/08/23/15/54/gummy-bear-9792290_1280.jpg',
    isVerified: true,
    location: 'San Francisco, USA',
    joinDate: 'Mar 2018',
  ),
  UserModel(
    id: '4',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
    username: 'Samantha Lee',
    handle: 'samanthalee',
    bio: 'Coffee and code. That’s my kind of morning ☕💻',
    followers: 950,
    following: 300,
    posts: [
      PostModel(
        id: 'p5',
        content: 'Working on a new art project. Stay tuned for updates!',
        time: '2h',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/08/21/13/58/grassland-9787999_1280.jpg',
    isVerified: false,
    location: 'Toronto, Canada',
    joinDate: 'Apr 2021',
  ),
  UserModel(
    id: '5',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/41.jpg',
    username: 'Michael Chen',
    handle: 'michaelchen',
    bio: 'Globetrotter | Foodie',
    followers: 1100,
    following: 420,
    posts: [
      PostModel(
        id: 'p6',
        content: 'Just landed in Tokyo! Can’t wait to explore the city. 🇯🇵',
        time: '3h',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/08/04/21/21/travel-9755525_1280.jpg',
    isVerified: true,
    location: 'Beijing, China',
    joinDate: 'May 2017',
  ),
  UserModel(
    id: '6',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
    username: 'Priya Singh',
    handle: 'priyasingh',
    bio: 'Flutter dev | Bookworm',
    followers: 1300,
    following: 390,
    posts: [
      PostModel(
        id: 'p7',
        content:
            'Reading a new book on Flutter development. Highly recommend it!',
        time: '4h',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/06/26/16/05/building-9682225_1280.jpg',
    isVerified: false,
    location: 'Mumbai, India',
    joinDate: 'Jun 2022',
  ),
  UserModel(
    id: '7',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/77.jpg',
    username: 'Carlos Rivera',
    handle: 'carlosr',
    bio: 'Taco lover | Traveler',
    followers: 700,
    following: 210,
    posts: [
      PostModel(
        id: 'p8',
        content: 'Had the best tacos ever in Mexico City today! 🌮',
        time: '5h',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2022/10/23/13/43/lake-7541307_1280.jpg',
    isVerified: true,
    location: 'Mexico City, Mexico',
    joinDate: 'Jul 2020',
  ),
  UserModel(
    id: '8',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
    username: 'Emily Clark',
    handle: 'emilyclark',
    bio: 'Artist | Dreamer',
    followers: 600,
    following: 180,
    posts: [
      PostModel(
        id: 'p9',
        content: 'Working on a new art project. Stay tuned for updates!',
        time: '6h',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/08/13/13/02/landscape-9772229_1280.jpg',
    isVerified: false,
    location: 'Sydney, Australia',
    joinDate: 'Aug 2021',
  ),
  UserModel(
    id: '9',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/45.jpg',
    username: 'David Kim',
    handle: 'davidkim',
    bio: 'Tech enthusiast | Flutter dev 💻',
    followers: 1200,
    following: 340,
    posts: [
      PostModel(
        id: 'p10',
        content: 'Just launched my first Flutter app! 🚀',
        time: '2h',
      ),
      PostModel(
        id: 'p11',
        content: 'Dark mode or light mode — which do you prefer? 🤔',
        time: '1d',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/08/21/17/12/summer-9788467_1280.jpg',
    isVerified: true,
    location: 'San Francisco, USA',
    joinDate: 'Jan 2020',
  ),

  UserModel(
    id: '10',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/65.jpg',
    username: 'Sophia Martinez',
    handle: 'sophiam',
    bio: 'Fitness coach | Healthy living 🌱',
    followers: 870,
    following: 290,
    posts: [
      PostModel(
        id: 'p12',
        content: 'Morning workout done ✅ Feeling amazing!',
        time: '3h',
      ),
      PostModel(id: 'p13', content: 'Hydration is key 💧', time: '5h'),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/08/22/01/18/rabbit-9788945_1280.jpg',
    isVerified: false,
    location: 'Barcelona, Spain',
    joinDate: 'Oct 2022',
  ),

  UserModel(
    id: '11',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/88.jpg',
    username: 'Michael Johnson',
    handle: 'mikejohnson',
    bio: 'Photographer 📸 | Capturing the world',
    followers: 4500,
    following: 500,
    posts: [
      PostModel(
        id: 'p14',
        content: 'Golden hour is the best hour 🌅',
        time: '12h',
      ),
      PostModel(
        id: 'p15',
        content: 'New photo series coming soon!',
        time: '2d',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/08/13/13/02/landscape-9772229_1280.jpg',
    isVerified: true,
    location: 'London, UK',
    joinDate: 'May 2018',
  ),

  UserModel(
    id: '12',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
    username: 'Amina Hassan',
    handle: 'aminahassan',
    bio: 'Storyteller | Sharing African tales 🌍',
    followers: 320,
    following: 150,
    posts: [
      PostModel(
        id: 'p16',
        content: 'New folktale video dropping tonight ✨',
        time: '4h',
      ),
      PostModel(
        id: 'p17',
        content:
            'Wisdom is like a baobab tree, one person’s arms cannot embrace it 🌳',
        time: '3d',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/04/24/22/36/beach-9556784_1280.jpg',
    isVerified: false,
    location: 'Accra, Ghana',
    joinDate: 'Dec 2023',
  ),
  UserModel(
    id: '13',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/30.jpg',
    username: 'Jake Miller',
    handle: 'thejake',
    bio: 'Just a guy with memes 🤷‍♂️',
    followers: 920,
    following: 180,
    posts: [
      PostModel(
        id: 'p18',
        content:
            'Me: I’ll go to bed early tonight. Also me at 3 AM: *learning about penguins on Wikipedia* 🐧😂',
        time: '1h',
      ),
      PostModel(
        id: 'p19',
        content:
            'Why do we press harder on the remote when the batteries are dying? 🤔',
        time: '5h',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2025/08/01/18/44/roller-coaster-9749194_1280.jpg',
    isVerified: false,
    location: 'Toronto, Canada',
    joinDate: 'Mar 2021',
  ),

  UserModel(
    id: '14',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/33.jpg',
    username: 'Lily Adams',
    handle: 'lillaughs',
    bio: 'Queen of sarcasm 👑',
    followers: 2500,
    following: 600,
    posts: [
      PostModel(
        id: 'p20',
        content:
            'Adulthood is basically saying “next week will be less busy” over and over until you die 😂',
        time: '2h',
      ),
      PostModel(
        id: 'p21',
        content:
            'Me: I need to save money. Also me: *orders food delivery again* 🍕😭',
        time: '1d',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2021/07/15/07/50/newborn-6467762_1280.jpg',
    isVerified: false,
    location: 'New York, USA',
    joinDate: 'Jul 2019',
  ),

  UserModel(
    id: '15',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
    username: 'Meme Central',
    handle: 'memecentral',
    bio: 'Daily dose of laughter 😂🔥',
    followers: 10500,
    following: 80,
    posts: [
      PostModel(
        id: 'p22',
        content: 'When you open the fridge and forget what you wanted: 🧍‍♂️',
        time: '30m',
      ),
      PostModel(
        id: 'p23',
        content:
            'WiFi went off for 5 minutes. I had to talk to my family. They seem like nice people. 😅',
        time: '7h',
      ),
    ],
    coverImageUrl:
        'https://cdn.pixabay.com/photo/2021/08/17/17/52/cat-6553749_1280.jpg',
    isVerified: true,
    location: 'Los Angeles, USA',
    joinDate: 'Nov 2017',
  ),
];
