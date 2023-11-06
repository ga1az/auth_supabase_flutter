import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_login/features/auth/presentation/screens/auth_screen.dart';
import 'package:google_login/features/auth/presentation/widgets/register_page.dart';
import 'package:google_login/features/home/presentation/screens/home_screen.dart';
import 'package:google_login/main_local.dart';

redirectIfNoSession(BuildContext context, GoRouterState state) {
  final session = supabase.auth.currentSession;
  if (session == null) {
    return '/login';
  }
  return null;
}

redirectIfSession(BuildContext context, GoRouterState state) {
  final session = supabase.auth.currentSession;
  if (session != null) {
    return '/home';
  }
  return null;
}

final router = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
    path: '/login',
    builder: (context, state) => const AuthScreen(),
    redirect: (context, state) => redirectIfSession(context, state),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeScreen(),
    redirect: (context, state) => redirectIfNoSession(context, state),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterPage(),
    redirect: (context, state) => redirectIfSession(context, state),
  )
]);
