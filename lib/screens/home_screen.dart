import 'package:flutter/material.dart';
import 'package:twitter_app/pages/chat_page.dart';
import 'package:twitter_app/pages/notification_page.dart';
import 'package:twitter_app/pages/profile_page.dart';
import 'package:twitter_app/pages/seacrh_page.dart';
import 'package:twitter_app/widgets/post_widget.dart';
import 'package:twitter_app/utils/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_app/utils/theme/theme_provider.dart';

final usersProvider = Provider<List<UserModel>>((ref) => users);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int _navIndex = 0;

  final List<Widget> _pages = [
    HomeTab(),
    SeacrhPage(),
    NotificationPage(),
    ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_navIndex]),
      floatingActionButton: _navIndex == 0
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (index) {
          setState(() {
            _navIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);
    // Collect all posts from all users
    final posts = users.expand((u) => u.posts).toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Danso jacob'),
                accountEmail: Text('@Jlem07'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/32.jpg',
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blue[700]),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TwitterProfileUI(username: 'Danso jacob',), 
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text('Chat'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.bookmark_border),
                title: Text('Bookmarks'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {},
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      onTap: () {},
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.brightness_6),
                    tooltip: 'Toggle Theme',
                    onPressed: () {
                      final container = ProviderScope.containerOf(context, listen: false);
                      container.read(themeProvider.notifier).toggleTheme();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              'https://randomuser.me/api/portraits/men/32.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/icons/logo.png',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              tabs: [
                Tab(text: 'For you'),
                Tab(text: 'Following'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      // Find user for this post
                      final user = users.firstWhere((u) => u.posts.contains(post));
                      return TwitterPostWidget(
                        profileImageUrl: user.profileImageUrl,
                        username: user.username,
                        handle: user.handle,
                        time: post.time,
                        tweetText: post.content,
                        isVerified: post.isVerified,
                      );
                    },
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      // Find user for this post
                      final user = users.firstWhere((u) => u.posts.contains(post));
                      return TwitterPostWidget(
                        profileImageUrl: user.profileImageUrl,
                        username: user.username,
                        handle: user.handle,
                        time: post.time,
                        tweetText: post.content,
                        isVerified: post.isVerified,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



