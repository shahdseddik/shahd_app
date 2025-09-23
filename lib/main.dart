import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/posts_screen.dart';
import 'screens/post_details_screen.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PostsScreen(), 
    ),
    GoRoute(
      path: '/posts',
      builder: (context, state) => const PostsScreen(),
      routes: [
        GoRoute(
          path: ':postId',
          builder: (context, state) {
            final postId = state.pathParameters['postId']!;
            return PostDetailsScreen(postId: postId);
          },
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}




