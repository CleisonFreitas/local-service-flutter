import 'package:flutter/material.dart';
import 'package:local_services/core/router/app_router.dart';
import 'package:local_services/core/theme/main_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Local Service',
      theme: appTheme,
      routerConfig: routerConfig,
    );
  }
}
