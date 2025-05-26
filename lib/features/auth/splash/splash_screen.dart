import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_services/core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ValueNotifier<bool> _isScreenLoading = ValueNotifier(false);

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      _isScreenLoading.value = true;

      Future.delayed(Duration(seconds: 3), () {
        if (!mounted) return;
        GoRouter.of(context).go('/auth/sign-in/home');
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _isScreenLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primary,
        alignment: Alignment.center,
        child: Builder(
          builder: (context) {
            return ValueListenableBuilder<bool>(
              valueListenable: _isScreenLoading,
              builder: (context, isLoading, _) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 140, // slightly larger than the image
                          height: 140,
                          child:
                              isLoading
                                  ? CircularProgressIndicator(
                                    color: AppColors.secondary,
                                    strokeWidth: 4,
                                  )
                                  : const SizedBox.shrink(),
                        ),
                        Image.asset(
                          'assets/images/WuP.png',
                          width: 120,
                          height: 120,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
