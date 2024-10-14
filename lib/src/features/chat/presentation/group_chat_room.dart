import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/chat/data/chat_repository.dart';
import 'package:language_learning_app/src/features/chat/presentation/chat_controller.dart';
import 'package:language_learning_app/src/features/class/presentation/classroom_controller.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';

import '../../../app.dart';
import 'single_message.dart';

class GroupChatRoom extends ConsumerStatefulWidget {
  const GroupChatRoom({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatRoomState();
}

class _ChatRoomState extends ConsumerState<GroupChatRoom> {
  final TextEditingController _messageController = TextEditingController();
  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(authRepositoryProvider).currentUser;
    final classroom = ref.watch(currentClassroomProvider);

    ref.listen<AsyncValue<dynamic>>(
      sendMessageProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Group Chat'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            ref.watch(allGroupMessagesProvider(classroom.id!)).when(
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
                                      .read(sendGroupMessageProvider.notifier)
                                      .send(classroom.id!, temp);
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
