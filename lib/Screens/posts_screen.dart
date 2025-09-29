import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/Screens/post_details_screen.dart';
import 'create_post_screen.dart';
import 'package:shahd_app/post_providers.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: postsAsync.when(
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(
              title: Text(post['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PostDetailsScreen(postId: post['id']),
                  ),
                );
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreatePostScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
