// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatBubbleChats extends StatefulWidget {
  const ChatBubbleChats({
    super.key,
    this.width,
    this.height,
    required this.isSender,
    required this.text,
    required this.timeStamp,
  });

  final double? width;
  final double? height;
  final bool isSender;
  final String text;
  final String timeStamp;
  @override
  State<ChatBubbleChats> createState() => _ChatBubbleChatsState();
}

class _ChatBubbleChatsState extends State<ChatBubbleChats> {
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper3(
          type: widget.isSender
              ? BubbleType.sendBubble
              : BubbleType.receiverBubble),
      alignment: widget.isSender ? Alignment.topRight : Alignment.topLeft,
      backGroundColor: widget.isSender
          ? Color.fromRGBO(160, 126, 255, 1)
          : Color.fromRGBO(253, 253, 253, 1),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.isSender
                      ? Colors.white
                      : Color.fromRGBO(36, 34, 36, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: Text(
                widget.timeStamp,
                style: TextStyle(
                  fontSize: 12,
                  color: widget.isSender
                      ? Colors.white
                      : Color.fromRGBO(36, 34, 36, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
