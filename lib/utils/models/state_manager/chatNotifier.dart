// lib/providers/chat_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_app/utils/models/chat_model.dart';


class ChatNotifier extends StateNotifier<List<ChatModel>> {
  ChatNotifier() : super(chats);

  void sendMessage(String chatId, String text, {bool isMe = true}) {
    state = state.map((chat) {
      if (chat.id == chatId) {
        final updatedMessages = List<Message>.from(chat.messages)
          ..add(
            Message(
              text: text,
              isMe: isMe,
              time: DateTime.now().toLocal().toString().substring(11, 16),
            ),
          );

        return chat.copyWith(
          messages: updatedMessages,
          lastMessage: text,
          time: "now",
        );
      }
      return chat;
    }).toList();
  }
}

final chatsProvider =
    StateNotifierProvider<ChatNotifier, List<ChatModel>>((ref) {
  return ChatNotifier();
});
