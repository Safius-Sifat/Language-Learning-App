import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:language_learning_app/src/app.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/class/data/classroom_repository.dart';
import 'package:language_learning_app/src/features/class/presentation/classroom_controller.dart';
import 'package:language_learning_app/src/features/pronunciation/domain/pronunciation_model.dart';
import 'package:language_learning_app/src/features/video/domain/video.dart';
import 'package:language_learning_app/src/features/video/presentation/video_widget.dart';
import 'package:language_learning_app/src/features/vocabulary/domain/vocabulary_model.dart';
import 'package:language_learning_app/src/utils/toastification.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../constants/constants.dart';
import '../../../../routing/app_router.dart';

class ClassroomPosts extends ConsumerWidget {
  const ClassroomPosts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    final classroom = ref.watch(currentClassroomProvider);
    final posts = ref.watch(classroomPostsProvider(classroom.id!));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.people.name, extra: classroom);
            },
            icon: const Icon(Icons.people),
          ),
          gapH12,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: double.infinity,
                padding: const EdgeInsets.all(Sizes.p8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(classroom.photoUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(Sizes.p12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classroom.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 200,
                      child: Text(classroom.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text('Classroom code: ${classroom.code}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white)),
                        gapW8,
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: classroom.code),
                            ).then(
                              (value) {
                                successToast(
                                  ctx: context,
                                  title: 'Code copied to clipboard',
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.copy,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              gapH8,
              if (classroom.teacherId == user!.uid)
                InkWell(
                  onTap: () {
                    showSelectChallenge(context, classroom.id!);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    padding: const EdgeInsets.all(Sizes.p8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(Sizes.p12),
                    ),
                    child: Row(
                      children: [
                        Initicon(
                          text: user.displayName ?? user.email ?? 'A',
                        ),
                        gapW8,
                        const Text('Post something to your class'),
                        const Spacer(),
                        const Icon(Icons.post_add_rounded),
                      ],
                    ),
                  ),
                ),
              gapH20,
              posts.when(
                data: (data) {
                  if (data.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        gapH80,
                        SizedBox(height: 200, child: SvgPicture.asset(kNoPost)),
                        gapH20,
                        Text(
                            classroom.teacherId == user.uid
                                ? 'This is where you can talk to your class'
                                : 'This is where you will get your study materials',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    );
                  }

                  return Column(
                    children: List.generate(
                      data.length,
                      (index) {
                        if (data[index] is VocabularyModel) {
                          final post = data[index] as VocabularyModel;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: Sizes.p12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(Sizes.p12),
                              onTap: () {
                                if (classroom.teacherId == user.uid) {
                                  context.pushNamed(AppRoute.participants.name,
                                      extra: post.participants);
                                } else {
                                  if (post.deadline.isBefore(DateTime.now())) {
                                    successToast(
                                        ctx: context,
                                        title: 'Assignment deadline is over');
                                    return;
                                  }
                                  context.pushNamed(
                                    AppRoute.learnVocabulary.name,
                                    extra: post,
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.p12),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(post.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w900)),
                                        if (user.uid == classroom.teacherId)
                                          PopupMenuButton(
                                            itemBuilder: (context) {
                                              return [
                                                PopupMenuItem(
                                                  child: const Text('Delete'),
                                                  onTap: () async {
                                                    await ref
                                                        .read(deletePostProvider
                                                            .notifier)
                                                        .deletePost(post.id!);
                                                  },
                                                ),
                                                PopupMenuItem(
                                                  child: const Text('Edit'),
                                                  onTap: () async {
                                                    context.goNamed(
                                                        AppRoute.editPost.name,
                                                        pathParameters: {
                                                          'name': post.name,
                                                          'deadline': post
                                                              .deadline
                                                              .toIso8601String(),
                                                          'postId': post.id!,
                                                        });
                                                  },
                                                ),
                                              ];
                                            },
                                          ),
                                      ],
                                    ),
                                    gapH8,
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Sizes.p8,
                                          vertical: Sizes.p4),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(Sizes.p16),
                                        color:
                                            MyApp.primaryColor.withOpacity(0.2),
                                      ),
                                      child: Text(
                                          '${post.participants.length}/${classroom.students.length} students completed',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w600)),
                                    ),
                                    const Spacer(),
                                    if (post.deadline.isAfter(DateTime.now()))
                                      Text(
                                          'Deadline at ${DateFormat('d MMM, h:mm a').format(post.deadline)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: Colors.grey))
                                    else
                                      Text('Deadline reached',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: Colors.grey))
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (data[index] is PronunciationModel) {
                          final post = data[index] as PronunciationModel;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: Sizes.p12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(Sizes.p12),
                              onTap: () {
                                if (classroom.teacherId == user.uid) {
                                  context.pushNamed(AppRoute.participants.name,
                                      extra: post.participants);
                                } else {
                                  if (post.deadline.isBefore(DateTime.now())) {
                                    successToast(
                                        ctx: context,
                                        title: 'Assignment deadline is over');
                                    return;
                                  }
                                  context.pushNamed(
                                    AppRoute.recordPronunciation.name,
                                    extra: post,
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.p12),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(post.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w900)),
                                        if (user.uid == classroom.teacherId)
                                          PopupMenuButton(
                                            itemBuilder: (context) {
                                              return [
                                                PopupMenuItem(
                                                  child: const Text('Delete'),
                                                  onTap: () async {
                                                    await ref
                                                        .read(deletePostProvider
                                                            .notifier)
                                                        .deletePost(post.id!);
                                                  },
                                                ),
                                                PopupMenuItem(
                                                  child: const Text('Edit'),
                                                  onTap: () async {
                                                    context.goNamed(
                                                        AppRoute.editPost.name,
                                                        pathParameters: {
                                                          'name': post.name,
                                                          'deadline': post
                                                              .deadline
                                                              .toIso8601String(),
                                                          'postId': post.id!,
                                                        });
                                                  },
                                                ),
                                              ];
                                            },
                                          ),
                                      ],
                                    ),
                                    gapH8,
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Sizes.p8,
                                          vertical: Sizes.p4),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(Sizes.p16),
                                        color:
                                            MyApp.primaryColor.withOpacity(0.2),
                                      ),
                                      child: Text(
                                          '${post.participants.length}/${classroom.students.length} students completed',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w600)),
                                    ),
                                    const Spacer(),
                                    if (post.deadline.isAfter(DateTime.now()))
                                      Text(
                                          'Deadline at ${DateFormat('d MMM, h:mm a').format(post.deadline)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: Colors.grey))
                                    else
                                      Text('Deadline reached',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: Colors.grey))
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          final post = data[index] as Video;
                          return Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(bottom: 12),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.p12),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: VideoWidget(
                                    filePath: post.videoUrl,
                                    fromFile: false,
                                  ),
                                ),
                                gapH8,
                                Text(post.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        )),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
                loading: () => const Skeletonizer(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClassroomPostShimmer(),
                      ClassroomPostShimmer(),
                      ClassroomPostShimmer(),
                    ],
                  ),
                ),
                error: (error, stack) => Text('Error: $error'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClassroomPostShimmer extends StatelessWidget {
  const ClassroomPostShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p12),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('VocabularyModel',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 17, fontWeight: FontWeight.w900)),
          gapH8,
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.p8, vertical: Sizes.p4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.p16),
              color: MyApp.primaryColor.withOpacity(0.2),
            ),
            child: Text('10/100 students completed',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    color: Colors.green,
                    fontWeight: FontWeight.w600)),
          ),
          const Spacer(),
          Text(
              'Created at ${DateFormat('d MMM, h:mm a').format(DateTime.now())}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

Future<void> showSelectChallenge(BuildContext context, String classroomId) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Pronunciation'),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoute.selectPronunciation.name,
                    pathParameters: {'classroomId': classroomId});
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Vocabulary'),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoute.selectVocabulary.name,
                    pathParameters: {'classroomId': classroomId});
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Video'),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoute.selectVideo.name,
                    pathParameters: {'classroomId': classroomId});
              },
            ),
          ],
        ),
      );
    },
  );
}
