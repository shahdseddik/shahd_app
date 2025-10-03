import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/Screens/create_post_screen.dart';
import 'package:shahd_app/Screens/post_details_screen.dart';
import 'package:shahd_app/providers/post_providers.dart';
import 'package:shahd_app/data/models/post_model.dart';
import 'package:shahd_app/widgets/theme_dropdown.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        actions: [
          const ThemeDropdown(),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreatePostScreen()),
        );
      },
    ),
  ],
),

      body: postsAsync.when(
        data: (posts) {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final PostModel post = posts[index];
              return ListTile(
                title: Text(post.title ?? 'No Title'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetailsScreen(postId: post.id!),
      ),
    );
  },
);

            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
