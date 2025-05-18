import 'package:go_router/go_router.dart';
import 'package:local_services/features/auth/sigin/signin.dart';
import 'package:local_services/features/auth/signup/signup.dart';
import 'package:local_services/features/auth/splash/splash_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const SignIn()),
    GoRoute(path: '/register', builder: (context, state) => const SignUp()),
  ],
);
