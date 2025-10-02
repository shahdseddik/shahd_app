import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/Screens/login_screen.dart';
import 'package:shahd_app/providers/auth_provider.dart';
import 'Screens/posts_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return Consumer(
      builder: (context, ref, _) {
        final authState = ref.watch(authProvider);
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
      home: authState.isLoggedIn
          ? const PostsScreen()
          : const LoginScreen(),
    );
  },
);
  }
}