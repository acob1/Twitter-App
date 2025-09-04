import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_app/utils/models/notification_model.dart';

final notificationsProvider = Provider<List<NotificationModel>>((ref) => notifications);

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allNotifications = ref.watch(notificationsProvider);
    final verifiedNotifications = allNotifications.where((n) => n.isVerified).toList();
    final mentionNotifications = allNotifications.where((n) => n.notificationText.toLowerCase().contains('mention')).toList();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Notifications', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Verified'),
              Tab(text: 'Mentions'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: allNotifications.length,
              itemBuilder: (context, index) {
                final n = allNotifications[index];
                return buildNotificationTile(
                  avatarUrl: n.profileImageUrl,
                  title: '${n.username} ${n.notificationText}',
                  time: n.time,
                  isVerified: n.isVerified,
                );
              },
            ),
            ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: verifiedNotifications.length,
              itemBuilder: (context, index) {
                final n = verifiedNotifications[index];
                return buildNotificationTile(
                  avatarUrl: n.profileImageUrl,
                  title: '${n.username} ${n.notificationText}',
                  time: n.time,
                  isVerified: n.isVerified,
                );
              },
            ),
            ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: mentionNotifications.length,
              itemBuilder: (context, index) {
                final n = mentionNotifications[index];
                return buildNotificationTile(
                  avatarUrl: n.profileImageUrl,
                  title: '${n.username} ${n.notificationText}',
                  time: n.time,
                  isVerified: n.isVerified,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationTile({
    required String avatarUrl,
    required String title,
    required String time,
    bool isVerified = false,
  }) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          if (isVerified)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Color(0xFF1DA1F2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(Icons.check, color: Colors.white, size: 12),
              ),
            ),
        ],
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      trailing: Icon(Icons.more_horiz, color: Colors.grey[600]),
      onTap: () {},
    );
  }
}