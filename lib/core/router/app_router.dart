import 'package:go_router/go_router.dart';
import 'package:writehub/feature/auth/presentation/pages/login_page.dart';
import 'package:writehub/feature/auth/presentation/pages/sign_up_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
  ],
);
