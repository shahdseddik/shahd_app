import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/post_repository.dart';


final postRepositoryProvider = Provider<PostRepository>((ref) => PostRepository());


final postsProvider = FutureProvider<List<dynamic>>((ref) async {
  final repo = ref.read(postRepositoryProvider);
  return repo.fetchPosts();
});


final postDetailsProvider = FutureProvider.family<Map<String, dynamic>?, int>((ref, id) async {
  final repo = ref.read(postRepositoryProvider);
  return repo.fetchPostDetails(id);
});


final createPostProvider = FutureProvider.family<Map<String, dynamic>?, Map<String, dynamic>>((ref, data) async {
  final repo = ref.read(postRepositoryProvider);
  return repo.createPost(data);
});
