import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = List.generate(5, (index) => "Post $index");

    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final postId = index.toString();
          return ListTile(
            title: Text(posts[index]),
            onTap: () {

              context.go('/posts/$postId');
            },
          );
        },
      ),
    );
  }
}
