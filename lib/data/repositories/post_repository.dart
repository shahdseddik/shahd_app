import '../api_client.dart';
import '../models/post_model.dart';

class PostsRepository {
  final ApiClient apiClient;

  PostsRepository({required this.apiClient});

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await apiClient.get("/posts");

      final List<PostModel> posts = (response.data as List)
          .map((json) => PostModel.fromJson(json))
          .toList();

      return posts;
    } catch (e) {
      throw Exception("Failed to fetch posts: $e");
    }
  }

  Future<PostModel?> fetchPostDetails(int id) async {
    try {
      final response = await apiClient.get("/posts/$id");
      return PostModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to fetch post details: $e");
    }
  }

  Future<PostModel?> createPost(Map<String, dynamic> data) async {
    try {
      final response = await apiClient.post("/posts", data);
      return PostModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to create post: $e");
    }
  }
}
