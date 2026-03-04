import 'package:flutter/material.dart';
import 'package:writehub/core/theme/theme.dart';
import 'package:writehub/feature/auth/presentation/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Write Hub',
      theme: AppTheme.darkThemeMode,
      home: const SignUpPage(),
    );
  }
}
