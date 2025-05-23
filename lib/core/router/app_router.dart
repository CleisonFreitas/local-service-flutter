import 'package:go_router/go_router.dart';
import 'package:local_services/features/auth/identification/identification_screen.dart';
import 'package:local_services/features/auth/password_recovery/email_otp_screen.dart';
import 'package:local_services/features/auth/password_recovery/email_recovery_screen.dart';
import 'package:local_services/features/auth/sigin/home_screen.dart';
import 'package:local_services/features/auth/sigin/login_screen.dart';
import 'package:local_services/features/auth/signup/signup_screen.dart';
import 'package:local_services/features/auth/splash/splash_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/identification',
      builder: (context, state) => const IdentificationScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/recovery-password-email',
      builder: (context, state) => const EmailRecoveryScreen(),
    ),
    GoRoute(
      path: '/recovery-otp-email',
      builder: (context, state) => const EmailOtpScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);
