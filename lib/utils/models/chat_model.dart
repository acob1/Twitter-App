// lib/utils/models/chat_model.dart
class ChatModel {
  final String id;
  final String profileImageUrl;
  final String username;
  final String lastMessage;
  final String time;
  final bool isRead;
  final List<Message> messages;

  ChatModel({
    required this.id,
    required this.profileImageUrl,
    required this.username,
    required this.lastMessage,
    required this.time,
    this.isRead = false,
    required this.messages,
  });

  ChatModel copyWith({
    String? lastMessage,
    String? time,
    List<Message>? messages,
  }) {
    return ChatModel(
      id: id,
      profileImageUrl: profileImageUrl,
      username: username,
      lastMessage: lastMessage ?? this.lastMessage,
      time: time ?? this.time,
      isRead: isRead,
      messages: messages ?? this.messages,
    );
  }
}

class Message {
  final String text;
  final String time;
  final bool isMe;

  Message({
    required this.text,
    required this.time,
    required this.isMe,
  });
}

final List<ChatModel> chats = [
  ChatModel(
    id: '1',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    username: 'Elon Musk',
    lastMessage: 'See you soon!',
    time: '2m',
    isRead: false,
    messages: [
      Message(text: 'Hey, how are you?', time: '2m', isMe: false),
      Message(text: 'I am good, thanks!', time: '2m', isMe: true),
      Message(text: 'See you soon!', time: '2m', isMe: false),
    ],
  ),
  ChatModel(
    id: '2',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
    username: 'Jane Doe',
    lastMessage: 'Let’s catch up later.',
    time: '10m',
    isRead: true,
    messages: [
      Message(text: 'Let’s catch up later.', time: '10m', isMe: false),
      Message(text: 'Sure!', time: '10m', isMe: true),
    ],
  ),
];
