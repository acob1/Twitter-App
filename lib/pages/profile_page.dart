import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_app/utils/models/post_model.dart';
import 'package:twitter_app/widgets/post_widget.dart';

class ProfileModel {
  final String profileImageUrl;
  final String username;
  final String handle;
  final String bio;
  final int followers;
  final int following;
  final int posts;

  ProfileModel({
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.bio,
    required this.followers,
    required this.following,
    required this.posts,
  });
}

final profileProvider = Provider<ProfileModel>((ref) => ProfileModel(
  profileImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
  username: 'Danso jacob',
  handle: '@Jlem07',
  bio: 'Flutter developer | Tech enthusiast | Coffee lover',
  followers: 1200,
  following: 350,
  posts: 245,
));

final userProvider = Provider<UserModel>((ref) => users[0]); // Example: first user

class ProfilePage extends ConsumerWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = users.firstWhere((u) => u.username == username);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).iconTheme.color,
          onPressed: () => Navigator.of(context).pop(),
        ),
       // title: Text(user.username, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 120,
              color: Colors.blue[100],
              child: null, // You can add a cover image here
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -40),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(user.profileImageUrl),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (user.username == 'Danso jacob')
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Edit Profile'),
                          )
                        else
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Follow'),
                          ),
                      ],
                    ),
                  ),
                  Text(user.username, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(user.handle, style: const TextStyle(color: Colors.grey, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(user.bio),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text('${user.following}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4),
                      const Text('Following'),
                      const SizedBox(width: 16),
                      Text('${user.followers}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4),
                      const Text('Followers'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('${user.posts.length}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          const Text('Posts'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('${user.followers}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          const Text('Followers'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('${user.following}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          const Text('Following'),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  // User's posts
                  Column(
                    children: user.posts.map((post) => TwitterPostWidget(
                      profileImageUrl: user.profileImageUrl,
                      username: user.username,
                      handle: user.handle,
                      time: post.time,
                      tweetText: post.content,
                      isVerified: post.isVerified,
                    )).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
