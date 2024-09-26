import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/features/quiz/presentation/quiz/quiz_screen.dart';
import 'package:language_learning_app/src/features/quiz/presentation/score/score_screen.dart';
import 'package:language_learning_app/src/features/quiz/presentation/welcome/welcome_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/repository/auth_repository.dart';
import '../features/auth/screen/login_screen.dart';
import '../features/auth/screen/regsitration_screen.dart';
import 'go_router_refresh_stream.dart';
import 'not_found_screen.dart';

part 'app_router.g.dart';

enum AppRoute {
  signIn,
  signUp,
  welcome,
  quiz,
  score,
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
          return '/welcome';
        }
      } else {
        if (path == '/welcome') {
          return '/signIn';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChange),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.quiz.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: QuizScreen(),
        ),
      ),
      GoRoute(
        path: '/welcome',
        name: AppRoute.welcome.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: WelcomeScreen(),
        ),
      ),
      GoRoute(
        path: '/score',
        name: AppRoute.score.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ScoreScreen(),
        ),
      ),
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
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}
