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
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Twitter',
              hintStyle: TextStyle(color: Theme.of(context).hintColor),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: Theme.of(context).iconTheme.color),
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
                Text(chat.username, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(chat.time, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            subtitle: Text(
              chat.lastMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(chat: chat),
                ),
              );
            },
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}