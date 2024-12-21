import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:whats_app/core/constants/AppColor.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message,required this.isSender,required this.color});

  final String message;
  final bool isSender;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialOne(
      text: message,
      isSender: isSender,
      color: color,
      textStyle: const TextStyle(
        fontSize: 20,
        color: AppColors.white,
      ),
    );
  }
}
