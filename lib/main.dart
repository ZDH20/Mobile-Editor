import 'package:flutter/material.dart';
import 'main_pages/home_screen.dart';
import '../sign_in_pages/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Sign In';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData.dark(),
      home: const SignIn(title: _title),
      debugShowCheckedModeBanner: false,
    );
  }
}

