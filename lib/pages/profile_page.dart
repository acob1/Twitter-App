
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_app/utils/models/post_model.dart';
import 'package:twitter_app/widgets/post_widget.dart';

// ------------------ FOLLOW STATE PROVIDER ------------------
class FollowNotifier extends StateNotifier<Set<String>> {
  FollowNotifier() : super({}); // store usernames you follow

  void toggleFollow(String username) {
    if (state.contains(username)) {
      state = {...state}..remove(username); // unfollow
    } else {
      state = {...state, username}; // follow
    }
  }

  bool isFollowing(String username) => state.contains(username);
}

final followProvider = StateNotifierProvider<FollowNotifier, Set<String>>(
  (ref) => FollowNotifier(),
);

// ------------------ PROFILE MODEL ------------------
class ProfileModel {
  final String profileImageUrl;
  final String username;
  final String handle;
  final String bio;
  final int followers;
  final int following;
  final int posts;
  final String location;
  final String website;
  final String joinedDate;

  ProfileModel({
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.bio,
    required this.followers,
    required this.following,
    required this.posts,
    required this.location,
    required this.website,
    this.joinedDate = "January 2020",
  });
}

// Example profile provider
final profileProvider = Provider<ProfileModel>(
  (ref) => ProfileModel(
    profileImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    username: 'Danso jacob',
    handle: '@Jlem07',
    bio: 'Flutter developer | Tech enthusiast | Coffee lover',
    followers: 1200,
    following: 350,
    posts: 245,
    location: 'San Francisco, CA',
    website: 'https://jlem07.dev',
  ),
);

// Example: current logged-in user provider
final userProvider = Provider<UserModel>(
  (ref) => users[0],
);

// ------------------ PROFILE UI ------------------
class TwitterProfileUI extends ConsumerWidget {
  final String username;
  const TwitterProfileUI({super.key, required this.username});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = users.firstWhere((u) => u.username == username);
    final loggedInUser = ref.watch(userProvider);
    final followState = ref.watch(followProvider);
    final isFollowing = ref.read(followProvider.notifier).isFollowing(user.username);

    final isOwnProfile = user.username == loggedInUser.username;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------------- HEADER (Banner + Avatar) -----------------
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  user.coverImageUrl ??
                      "https://cdn.pixabay.com/photo/2025/08/21/13/58/grassland-9787999_1280.jpg",
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 16,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: NetworkImage(user.profileImageUrl),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // ----------------- NAME + HANDLE + FOLLOW/EDIT -----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.username,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(user.handle,
                          style: const TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {
                      if (isOwnProfile) {
                        // Navigate to Edit Profile
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Edit Profile clicked")),
                        );
                      } else {
                        ref.read(followProvider.notifier).toggleFollow(user.username);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isFollowing ? Colors.black : Colors.blue,
                      side: BorderSide(
                        color: isFollowing ? Colors.grey : Colors.blue,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      isOwnProfile
                          ? "Edit Profile"
                          : (isFollowing ? "Following" : "Follow"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ----------------- BIO -----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(user.bio),
            ),

            const SizedBox(height: 12),

            // ----------------- LOCATION + WEBSITE + JOINED -----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  if (user.location != null) ...[
                    const Icon(Icons.location_on_outlined,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(user.location!,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                  const SizedBox(width: 16),
                  if (user.website != null) ...[
                    const Icon(Icons.link, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(user.website!,
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline)),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today,
                      size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text("Joined ${user.joinDate}",
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ----------------- FOLLOWERS -----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text("${user.following}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(width: 4),
                  const Text("Following", style: TextStyle(color: Colors.grey)),
                  const SizedBox(width: 16),
                  Text(_formatFollowers(user.followers),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(width: 4),
                  const Text("Followers", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const Divider(height: 30),

            // ----------------- TABS (Posts, Replies, Media) -----------------
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blue,
                    tabs: [
                      Tab(text: "Posts"),
                      Tab(text: "Replies"),
                      Tab(text: "Media"),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [
                        Column(
                          children: user.posts
                              .map((post) => TwitterPostWidget(
                                    profileImageUrl: user.profileImageUrl,
                                    username: user.username,
                                    handle: user.handle,
                                    time: post.time,
                                    tweetText: post.content,
                                    isVerified: post.isVerified, tweetId: 'hgghg',
                                  ))
                              .toList(),
                        ),
                        const Center(child: Text("No replies yet")),
                        const Center(child: Text("No media yet")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Format numbers like "278K"
  static String _formatFollowers(int value) {
    if (value >= 1000000) {
      return "${(value / 1000000).toStringAsFixed(1)}M";
    } else if (value >= 1000) {
      return "${(value / 1000).toStringAsFixed(value >= 10000 ? 0 : 1)}K";
    } else {
      return value.toString();
    }
  }
}



