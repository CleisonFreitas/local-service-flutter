import 'package:go_router/go_router.dart';
import 'package:local_services/features/auth/sigin/home_screen.dart';
import 'package:local_services/features/auth/sigin/login_screen.dart';
import 'package:local_services/features/auth/signup/signup.dart';
import 'package:local_services/features/auth/splash/splash_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/register', builder: (context, state) => const SignUp()),
  ],
);
