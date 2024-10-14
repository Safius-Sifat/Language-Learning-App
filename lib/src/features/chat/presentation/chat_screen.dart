import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/features/chat/data/chat_repository.dart';
import 'package:language_learning_app/src/routing/app_router.dart';

import '../../auth/repository/auth_repository.dart';
import '../../class/presentation/classroom_controller.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classroom = ref.watch(currentClassroomProvider);
    final users = ref.watch(fetchUsersProvider(ids: classroom.students));
    final currentUser = ref.watch(authRepositoryProvider).currentUser;
    final teacher = ref.watch(fetchUserByIdProvider(id: classroom.teacherId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: classroom.teacherId != currentUser!.uid
          ? teacher.when(
              data: (data) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        context.goNamed(AppRoute.groupChatRoom.name);
                      },
                      leading: const Icon(Icons.group),
                      title: const Text('Group chat'),
                    ),
                    ListTile(
                      leading: data.photoUrl == null
                          ? Initicon(text: data.name ?? data.email, size: 32.0)
                          : CircleAvatar(
                              backgroundImage: NetworkImage(data.photoUrl!),
                              radius: 16,
                            ),
                      onTap: () {
                        context.goNamed(AppRoute.chatRoom.name, extra: data);
                      },
                      title: Text(data.name ?? data.email),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text(error.toString())),
            )
          : users.when(
              data: (users) => ListView.builder(
                itemCount: users.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ListTile(
                      onTap: () {
                        context.goNamed(AppRoute.groupChatRoom.name);
                      },
                      leading: const Icon(Icons.group),
                      title: const Text('Group chat'),
                    );
                  }

                  final user = users[index - 1];
                  return ListTile(
                    leading: user.photoUrl == null
                        ? Initicon(text: user.name ?? user.email, size: 32.0)
                        : CircleAvatar(
                            backgroundImage: NetworkImage(user.photoUrl!),
                            radius: 16,
                          ),
                    onTap: () {
                      context.goNamed(AppRoute.chatRoom.name, extra: user);
                    },
                    title: Text(user.name ?? user.email),
                    subtitle: ref.watch(lastMessageProvider(user)).when(
                          data: (data) {
                            if (data.isNotEmpty) {
                              return Text(data.first.msg);
                            } else {
                              return Text(
                                user.isOnline
                                    ? 'Online'
                                    : 'last seen at ${user.lastActive}',
                                style: TextStyle(color: Colors.grey.shade300),
                              );
                            }
                          },
                          error: (e, st) => const Text(''),
                          loading: () => const Text(''),
                        ),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text(error.toString())),
            ),
    );
  }
}
