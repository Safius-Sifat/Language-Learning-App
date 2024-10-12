import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';

class Avatar extends ConsumerWidget {
  const Avatar({super.key, this.size = 32.0});
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    if (user != null && user.photoURL != null) {
      return CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(user.photoURL!),
      );
    } else {
      return Initicon(
          text: user?.displayName ?? user?.email ?? "A", size: size);
    }
  }
}
