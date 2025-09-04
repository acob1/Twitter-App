import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_app/utils/models/chat_model.dart';
import 'chat_detail_page.dart';

final chatsProvider = Provider<List<ChatModel>>((ref) => chats);

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatList = ref.watch(chatsProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
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
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat.profileImageUrl),
              radius: 26,
            ),
            title: Row(
              children: [
                Text(chat.username, style: const TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(chat.time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            subtitle: Text(
              chat.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: chat.isRead ? FontWeight.normal : FontWeight.bold,
                color: chat.isRead ? Colors.grey[700] : Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(chat: chat),
                ),
              );
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}