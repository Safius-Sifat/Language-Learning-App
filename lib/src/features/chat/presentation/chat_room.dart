import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/features/auth/domain/user_model.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/chat/data/chat_repository.dart';
import 'package:language_learning_app/src/features/chat/presentation/chat_controller.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';

import '../../../app.dart';
import 'single_message.dart';

class ChatRoom extends ConsumerStatefulWidget {
  const ChatRoom({super.key, required this.user});

  final UserModel user;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatRoomState();
}

class _ChatRoomState extends ConsumerState<ChatRoom> {
  final TextEditingController _messageController = TextEditingController();
  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(authRepositoryProvider).currentUser;

    ref.listen<AsyncValue<dynamic>>(
      sendMessageProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              if (widget.user.photoUrl != null)
                CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(widget.user.photoUrl!),
                )
              else
                Initicon(
                  text: widget.user.name ?? widget.user.email,
                  size: 24,
                ),
              gapW8,
              Text(
                widget.user.name ?? widget.user.email,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            ref.watch(allMessagesProvider(widget.user)).when(
                  data: (messages) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SingleMessage(
                            message: messages[index],
                            userId: currentUser!.uid,
                          );
                        },
                      ),
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(child: Text(error.toString())),
                ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormField(
                        controller: _messageController,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          hintText: "Type here",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: IconButton(
                              onPressed: () async {
                                String temp = _messageController.text;
                                _messageController.clear();
                                if (temp.isNotEmpty) {
                                  await ref
                                      .read(sendMessageProvider.notifier)
                                      .send(widget.user, temp);
                                }
                              },
                              icon: const Icon(
                                Icons.send,
                                color: MyApp.primaryColor,
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: MyApp.primaryColor,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: MyApp.primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
