import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_services/blocs/base_state.dart';
import 'package:local_services/blocs/generic_bloc_listener.dart';
import 'package:local_services/features/auth/identification/identification_screen.dart';
import 'package:local_services/features/auth/password_recovery/bloc/logic/email_recovery_logic.dart';
import 'package:local_services/features/auth/password_recovery/email_otp_screen.dart';
import 'package:local_services/features/auth/password_recovery/email_recovery_screen.dart';
import 'package:local_services/features/auth/password_recovery/new_password_screen.dart';
import 'package:local_services/features/auth/signin/bloc/logic/login_form_bloc.dart';
import 'package:local_services/features/auth/signin/home_screen.dart';
import 'package:local_services/features/auth/signin/login_screen.dart';
import 'package:local_services/features/auth/signup/signup_screen.dart';
import 'package:local_services/features/auth/splash/splash_screen.dart';
import 'package:local_services/features/booking/customer_booking_screen.dart';
import 'package:local_services/features/services/bloc/logic/profile_form_bloc.dart';
import 'package:local_services/features/services/profile/profile_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/auth/sign-in/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/auth/identification',
      builder: (context, state) => const IdentificationScreen(),
    ),
    GoRoute(
      path: '/auth/sign-in/login',
      builder:
          (context, state) => BlocProvider(
            create: (_) => LoginFormBloc(),
            child: GenericBlocListener<LoginFormBloc, BaseState>(
              child: const LoginScreen(),
            ),
          ),
    ),
    GoRoute(
      path: '/auth/password-recovery/recovery-password-email',
      builder:
          (context, state) => BlocProvider(
            create: (_) => EmailRecoveryLogic(),
            child: GenericBlocListener<EmailRecoveryLogic, BaseState>(
              child: const EmailRecoveryScreen(),
              onSuccess: (context, _) {
                context.go('/auth/password-recovery/recovery-otp-email');
              },
            ),
          ),
    ),
    GoRoute(
      path: '/auth/password-recovery/recovery-otp-email',
      builder: (context, state) => const EmailOtpScreen(),
    ),
    GoRoute(
      path: '/auth/password-recovery/recovery-new-password',
      builder: (context, state) => const NewPasswordScreen(),
    ),
    GoRoute(
      path: '/auth/sign-up/register',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/booking/customer-booking',
      builder: (context, state) => const CustomerBookingScreen(),
    ),
    GoRoute(
      path: '/services/profile',
      builder:
          (context, state) => BlocProvider(
            create: (_) => ProfileFormBloc(),
            child: GenericBlocListener<ProfileFormBloc, BaseState>(
              child: const ProfileScreen(),
            ),
          ),
    ),
  ],
);
