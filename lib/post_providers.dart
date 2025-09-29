import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/postModel.dart';
import 'package:shahd_app/post_repository.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) => PostRepository());


final postsProvider = FutureProvider<List<PostModel>>((ref) async {
  return ref.read(postRepositoryProvider).fetchPosts();
});


final postDetailsProvider = FutureProvider.family<PostModel ?, int>((ref, id) async {
  return ref.read(postRepositoryProvider).fetchPostDetails(id);
});


final createPostProvider = FutureProvider.family<PostModel ?, Map<String, dynamic>>((ref, data) async {
  final repo = ref.read(postRepositoryProvider);
  return repo.createPost(data);
});
