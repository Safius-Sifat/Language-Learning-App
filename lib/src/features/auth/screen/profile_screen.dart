import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/features/auth/controller/auth_controller.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';

import '../../../common/overlay_loader.dart';
import '../../../utils/alert_dialogs.dart';
import '../../../utils/toastification.dart';
// import 'package:life/core/utils/dialogs.dart';
// import 'package:life/features/auth/controllers/auth_controller.dart';
//
// import '../../../core/constants/constants.dart';
// import '../../../core/providers/sign_in_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<dynamic>>(
      resetPasswordProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    final user = ref.watch(authRepositoryProvider).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: <Widget>[
            if (user != null && user.photoURL != null)
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            if (user == null || user.photoURL == null)
              Initicon(
                  text: user?.displayName ?? user?.email ?? "A",
                  // backgroundColor: Colors.blue,
                  size: 64.0),
            Text(
              textAlign: TextAlign.center,
              user?.displayName ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              textAlign: TextAlign.center,
              user?.email ?? "",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Account",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                final confirmDelete = await showAlertDialog(
                    context: context,
                    title: "Change Password",
                    content:
                        "We will send a reset password link to your email.",
                    cancelActionText: "Cancel",
                    defaultActionText: "Send");

                if (confirmDelete ?? false) {
                  showOverlayLoader(context);

                  final success = await ref
                      .read(resetPasswordProvider.notifier)
                      .resetPassword();
                  context.pop();
                  if (success) {
                    successToast(
                        ctx: context,
                        title: "Password reset link sent to your email");
                  }
                }
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.password),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Change Password",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                await ref.read(authRepositoryProvider).logOut();
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Sign Out",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                final confirmDelete = await showAlertDialog(
                    context: context,
                    title: "Delete Account",
                    content: "Are you sure you want to delete your account?",
                    defaultActionText: "Delete");
                if (confirmDelete ?? false) {
                  await ref.read(authRepositoryProvider).deleteAccount();
                }
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.delete_forever_outlined, color: Colors.red),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Delete Account",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
