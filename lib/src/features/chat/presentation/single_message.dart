import 'package:flutter/material.dart';
import 'package:language_learning_app/src/features/chat/domain/message.dart';

class SingleMessage extends StatelessWidget {
  final Message message;
  final String userId;
  const SingleMessage({
    super.key,
    required this.message,
    required this.userId,
  });

  bool get isMe => message.fromId == userId;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe ? _buildSenderMessage() : _buildReceiverMessage(),
      ],
    );
  }

  Widget _buildSenderMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(
            //   Methods.getTimeFromTimestamp(message.timeStamp!),
            //   style:
            //       const TextStyle(color: CustomColors.charcoal, fontSize: 6.5),
            // ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(8),
              constraints: const BoxConstraints(maxWidth: 200),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 2,
                        spreadRadius: 0.1,
                        color: Colors.grey)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.zero)),
              child: Text(
                message.msg,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            // CircularImage(
            //   borderWidth: 0,
            //   borderColor: Colors.transparent,
            //   radius: 15,
            //   elevation: 0,
            //   imageUrl: _messageController
            //       .chatRoom.images![_messageController.oIndex],
            //   placeHolderUrl: 'assets/images/person_2.png',
            // ),
          ],
        ),
      ],
    );
  }

  Widget _buildReceiverMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // CircularImage(
            //   borderWidth: 0,
            //   borderColor: Colors.transparent,
            //   radius: 15,
            //   elevation: 0,
            //   imageUrl:
            //       _messageController.chatRoom.images![_messageController.index],
            //   placeHolderUrl: 'assets/images/person_2.png',
            // ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(8),
              constraints: const BoxConstraints(maxWidth: 200),
              decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 2,
                        spreadRadius: 0.1,
                        color: Colors.grey)
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.circular(15))),
              child: Text(
                message.msg,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            // Text(
            //   Methods.getTimeFromTimestamp(message.timeStamp!),
            //   style:
            //       const TextStyle(color: CustomColors.charcoal, fontSize: 6.5),
            // ),
          ],
        ),
      ],
    );
  }
}
