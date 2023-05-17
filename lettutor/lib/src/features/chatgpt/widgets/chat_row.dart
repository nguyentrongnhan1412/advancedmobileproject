import 'package:flutter/material.dart';
import 'package:lettutor/src/models/message/message_type.dart';

class ChatRow extends StatelessWidget {
  const ChatRow({super.key, required this.text, required this.messageType});
  final String text;
  final MessageType messageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16),
      color: messageType == MessageType.bot ? Colors.grey : Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          messageType == MessageType.bot ? Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.account_box_outlined),
              )
          ) : Container(margin: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(
              backgroundColor: Colors.pink,
              child: Icon(Icons.person),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [

                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)),),

                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.pink),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}