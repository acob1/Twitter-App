class ChatModel {
  final String profileImageUrl;
  final String username;
  final String lastMessage;
  final String time;
  final bool isRead;
  final List<Message> messages;

  ChatModel({
    required this.profileImageUrl,
    required this.username,
    required this.lastMessage,
    required this.time,
    this.isRead = false,
    required this.messages,
  });
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
  ChatModel(
    profileImageUrl: 'https://randomuser.me/api/portraits/men/85.jpg',
    username: 'Benji Quan',
    lastMessage: 'a hear you no dey accra again',
    time: '10m',
    isRead: false,
    messages: [
      Message(text: 'Heya wosop man?', time: '11m', isMe: false),
      Message(text: 'a hear you no dey accra again', time: '11m', isMe: false),
    ],
  ),
];
