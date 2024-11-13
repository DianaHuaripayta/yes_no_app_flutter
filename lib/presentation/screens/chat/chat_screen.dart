import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/share/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img.dizi.la/uploads/29269/conversions/Mahkum-act-image-add7d417-9cbc-43e7-8f03-aebf8db6d892-thumb.jpg'),
          ),
        ),
        title: const Text('Mi Amor '),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SaveArea();
  }
}

class SaveArea extends StatelessWidget {
  const SaveArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   // final chatProvider = context.watch()<ChatProvider>();
    final chatProvider = context.watch<ChatProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Expanded(
          child: ListView.builder(
            controller: chatProvider.chatScrollController,
            itemCount: chatProvider.messageList.length,
            itemBuilder: (context, int index) {
              final message = chatProvider.messageList[index];
              return (message.fromWho == FromWho.hers)
                  ?  HerMessageBubble(message : message)
                  : MyMessageBubble(message : message);
            },
          ),
        ),
         MessageFieldBox(
          onValue: (value) => chatProvider.SendMessage(value),
         ),
      ]),
    );
  }
}
