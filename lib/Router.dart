import 'package:flutter_todolist/features/SplashScreen/SplashScreen.dart';
import 'package:flutter_todolist/features/home/LoginPage/LoginPage.dart';
import 'package:flutter_todolist/features/home/signin/SigninPage.dart';
import 'package:flutter_todolist/features/taskpages/TodayPage2.dart';
import 'package:flutter_todolist/features/pages/OnboardingScreen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/home', builder: (context, state) => OnboardingScreen()),
      GoRoute(path: '/login', builder: (context, state) => LoginPage()),
      GoRoute(path: '/signin', builder: (context, state) => SigninPage()),
      GoRoute(path: '/homeview', builder: (context, state) => TodayPage()),
    ],
  );
}
