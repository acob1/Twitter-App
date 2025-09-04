import 'package:flutter/material.dart';

class SeacrhPage extends StatefulWidget {
  const SeacrhPage({super.key});

  @override
  State<SeacrhPage> createState() => _SeacrhPageState();
}

class _SeacrhPageState extends State<SeacrhPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                  backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                ),
                decoration: BoxDecoration(color: Colors.blue[700]),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text('Lists'),
                onTap: () {},
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
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
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
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Twitter',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings_outlined, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            isScrollable: true,
            tabs: [
              Tab(text: 'For you'),
              Tab(text: 'Trending'),
              Tab(text: 'News'),
              Tab(text: 'Sports'),
              Tab(text: 'Entertainment'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            // For you tab
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                SizedBox(height: 16),
                Text('Trends for you', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 16),
                _buildTrendTile('#FlutterDev', '120K posts'),
                _buildTrendTile('Dart', '80K posts'),
                _buildTrendTile('OpenAI', '60K posts'),
                _buildTrendTile('Apple Event', 'Trending'),
                _buildTrendTile('Messi', '150K posts'),
                _buildTrendTile('XCode', '20K posts'),
              ],
            ),
            // Trending tab
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                SizedBox(height: 16),
                Text('Trending now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 16),
                _buildTrendTile('#AI', '200K posts'),
                _buildTrendTile('Flutter 4.0', 'Trending'),
                _buildTrendTile('Champions League', '90K posts'),
                _buildTrendTile('Taylor Swift', '300K posts'),
                _buildTrendTile('SpaceX', '50K posts'),
                _buildTrendTile('Climate Change', 'Trending'),
              ],
            ),
            // News tab
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                SizedBox(height: 16),
                Text('News', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 16),
                _buildTrendTile('Global Markets', 'Trending'),
                _buildTrendTile('Elections 2025', 'Trending'),
                _buildTrendTile('Tech News', '45K posts'),
                _buildTrendTile('COVID-19', 'Trending'),
                _buildTrendTile('Stock Market', 'Trending'),
                _buildTrendTile('World News', 'Trending'),
              ],
            ),
            // Sports tab
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                SizedBox(height: 16),
                Text('Sports', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 16),
                _buildTrendTile('Champions League', '90K posts'),
                _buildTrendTile('NBA Finals', 'Trending'),
                _buildTrendTile('Messi', '150K posts'),
                _buildTrendTile('Olympics', 'Trending'),
                _buildTrendTile('Super Bowl', 'Trending'),
                _buildTrendTile('Serena Williams', 'Trending'),
              ],
            ),
            // Entertainment tab
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                SizedBox(height: 16),
                Text('Entertainment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 16),
                _buildTrendTile('Taylor Swift', '300K posts'),
                _buildTrendTile('Oscars', 'Trending'),
                _buildTrendTile('Barbie Movie', 'Trending'),
                _buildTrendTile('Netflix', 'Trending'),
                _buildTrendTile('Grammy Awards', 'Trending'),
                _buildTrendTile('Marvel', 'Trending'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendTile(String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      trailing: Icon(Icons.more_horiz, color: Colors.grey[600]),
      onTap: () {},
    );
  }
}