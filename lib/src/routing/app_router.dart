import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/features/auth/domain/user_model.dart';
import 'package:language_learning_app/src/features/auth/screen/profile_screen.dart';
import 'package:language_learning_app/src/features/chat/presentation/chat_room.dart';
import 'package:language_learning_app/src/features/chat/presentation/chat_screen.dart';
import 'package:language_learning_app/src/features/chat/presentation/group_chat_room.dart';
import 'package:language_learning_app/src/features/class/domain/classroom.dart';
import 'package:language_learning_app/src/features/class/presentation/all_classrooms/all_classroom_screen.dart';
import 'package:language_learning_app/src/features/class/presentation/classroom_actions/create_classroom.dart';
import 'package:language_learning_app/src/features/class/presentation/detail/classroom_people.dart';
import 'package:language_learning_app/src/features/class/presentation/detail/classroom_posts.dart';
import 'package:language_learning_app/src/features/class/presentation/detail/participant_screen.dart';
import 'package:language_learning_app/src/features/pronunciation/presentation/create_challenge/create_pronunciation_screen.dart';
import 'package:language_learning_app/src/features/pronunciation/presentation/create_challenge/select_pronunciation_screen.dart';
import 'package:language_learning_app/src/features/pronunciation/presentation/pronunciation_screen.dart';
import 'package:language_learning_app/src/features/video/presentation/video_selection_screen.dart';
import 'package:language_learning_app/src/features/vocabulary/presentation/learn_vocabulary_screen.dart';
import 'package:language_learning_app/src/features/vocabulary/presentation/select_vocabulary_screen.dart';
import 'package:language_learning_app/src/routing/scaffold_with_nested_navigation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/repository/auth_repository.dart';
import '../features/auth/screen/login_screen.dart';
import '../features/auth/screen/regsitration_screen.dart';
import '../features/class/presentation/classroom_actions/join_classroom.dart';
import '../features/pronunciation/domain/pronunciation_model.dart';
import '../features/vocabulary/domain/vocabulary_model.dart';
import 'go_router_refresh_stream.dart';
import 'not_found_screen.dart';

part 'app_router.g.dart';

enum AppRoute {
  signIn,
  signUp,
  allClassrooms,
  createClassroom,
  joinClassroom,
  posts,
  people,
  recordPronunciation,
  selectPronunciation,
  createPronunciation,
  selectVideo,
  selectVocabulary,
  learnVocabulary,
  participants,
  profile,
  chat,
  chatRoom,
  groupChatRoom,
}

final _chatNavigatorKey = GlobalKey<NavigatorState>();

final _postsNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorKey = GlobalKey<NavigatorState>();
@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/signIn',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path == '/signIn' || path == '/signUp') {
          return '/';
        }
      } else {
        if (path == '/' || path == '/profile') {
          return '/signIn';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChange),
    routes: [
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/signUp',
        name: AppRoute.signUp.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: RegistrationScreen(),
        ),
      ),
      GoRoute(
        path: '/',
        name: AppRoute.allClassrooms.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AllClassroomScreen(),
        ),
        routes: [
          GoRoute(
            path: 'createClassroom',
            name: AppRoute.createClassroom.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CreateClassroomScreen(),
            ),
          ),
          GoRoute(
            path: 'joinClassroom',
            name: AppRoute.joinClassroom.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: JoinClassroomScreen(),
            ),
          ),
          GoRoute(
            path: 'profile',
            name: AppRoute.profile.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
          GoRoute(
            path: 'people',
            name: AppRoute.people.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: ClassroomPeople(
                classroom: state.extra! as Classroom,
              ),
            ),
          ),
          // GoRoute(
          //   path: 'posts',
          //   name: AppRoute.posts.name,
          //   pageBuilder: (context, state) => NoTransitionPage(
          //     child: ClassroomPosts(
          //       classroom: state.extra! as Classroom,
          //     ),
          //   ),
          // ),
          GoRoute(
            path: 'createPronunciation/:text/:name/:deadline/:classroomId',
            name: AppRoute.createPronunciation.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: CreatePronunciationScreen(
                text: state.pathParameters['text']!,
                name: state.pathParameters['name']!,
                deadline: state.pathParameters['deadline']!,
                classroomId: state.pathParameters['classroomId']!,
              ),
            ),
          ),
          GoRoute(
            path: 'selectPronunciation/:classroomId',
            name: AppRoute.selectPronunciation.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: SelectPronunciationScreen(
                classroomId: state.pathParameters['classroomId']!,
              ),
            ),
          ),
          GoRoute(
            path: 'recordPronunciation',
            name: AppRoute.recordPronunciation.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: PronunciationScreen(
                pronunciation: state.extra! as PronunciationModel,
              ),
            ),
          ),
          GoRoute(
            path: 'selectVideo/:classroomId',
            name: AppRoute.selectVideo.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: VideoSelectionScreen(
                classroomId: state.pathParameters['classroomId']!,
              ),
            ),
          ),
          GoRoute(
            path: 'selectVocabulary/:classroomId',
            name: AppRoute.selectVocabulary.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: SelectVocabularyScreen(
                classroomId: state.pathParameters['classroomId']!,
              ),
            ),
          ),
          GoRoute(
            path: 'learnVocabulary',
            name: AppRoute.learnVocabulary.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: LearnVocabularyScreen(
                  vocabulary: state.extra! as VocabularyModel),
            ),
          ),
          GoRoute(
            path: 'participants',
            name: AppRoute.participants.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: ParticipantScreen(
                participants: state.extra! as List<Participant>,
              ),
            ),
          ),
          StatefulShellRoute.indexedStack(
            pageBuilder: (context, state, navigationShell) => NoTransitionPage(
              child: ScaffoldWithNestedNavigation(
                  navigationShell: navigationShell),
            ),
            branches: [
              StatefulShellBranch(navigatorKey: _postsNavigatorKey, routes: [
                GoRoute(
                  path: 'posts',
                  name: AppRoute.posts.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ClassroomPosts(),
                  ),
                ),
              ]),
              StatefulShellBranch(navigatorKey: _chatNavigatorKey, routes: [
                GoRoute(
                    path: 'chat',
                    name: AppRoute.chat.name,
                    pageBuilder: (context, state) => const NoTransitionPage(
                          child: ChatScreen(),
                        ),
                    routes: [
                      GoRoute(
                        path: 'chatRoom',
                        name: AppRoute.chatRoom.name,
                        pageBuilder: (context, state) => NoTransitionPage(
                          child: ChatRoom(
                            user: state.extra! as UserModel,
                          ),
                        ),
                      ),
                      GoRoute(
                        path: 'groupChatRoom',
                        name: AppRoute.groupChatRoom.name,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: GroupChatRoom(),
                        ),
                      ),
                    ]),
              ]),
            ],
          )
        ],
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}
