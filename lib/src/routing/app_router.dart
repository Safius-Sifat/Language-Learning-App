import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/features/class/presentation/all_classrooms/all_classroom_screen.dart';
import 'package:language_learning_app/src/features/class/presentation/classroom_actions/create_classroom.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/repository/auth_repository.dart';
import '../features/auth/screen/login_screen.dart';
import '../features/auth/screen/regsitration_screen.dart';
import '../features/class/presentation/classroom_actions/join_classroom.dart';
import 'go_router_refresh_stream.dart';
import 'not_found_screen.dart';

part 'app_router.g.dart';

enum AppRoute {
  signIn,
  signUp,
  allClassrooms,
  createClassroom,
  joinClassroom,
}

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
        if (path == '/') {
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
        ],
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}
