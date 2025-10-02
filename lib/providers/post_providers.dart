import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/data/models/post_model.dart';
import 'package:shahd_app/data/repositories/post_repository.dart';
import 'package:shahd_app/data/api_client.dart';
import 'package:shahd_app/config/app_config.dart';

final postsApiClientProvider = Provider<ApiClient>((ref) => ApiClient(baseUrl: AppConfig.postsBaseUrl));

final postRepositoryProvider = Provider<PostsRepository>((ref) {
  final apiClient = ref.read(postsApiClientProvider);
  return PostsRepository(apiClient: apiClient);
});

final postsProvider = FutureProvider<List<PostModel>>((ref) async {
  final repo = ref.read(postRepositoryProvider);
  return repo.fetchPosts();
});

final postDetailsProvider = FutureProvider.family<PostModel?, int>((ref, id) async {
  final repo = ref.read(postRepositoryProvider);
  return repo.fetchPostDetails(id);
});

final createPostProvider = FutureProvider.family<PostModel?, Map<String, dynamic>>((ref, data) async {
  final repo = ref.read(postRepositoryProvider);
  return repo.createPost(data);
});
