import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/post_providers.dart';

class PostDetailsScreen extends ConsumerWidget {
  final int postId;
  const PostDetailsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postDetailsProvider(postId));

    return Scaffold(
      appBar: AppBar(title: Text('Post #$postId')),
      body: postAsync.when(
        data: (post) => post == null
            ? const Center(child: Text('No data'))
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.title ?? 'No Title' , style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(post.body ?? 'No Body', style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
