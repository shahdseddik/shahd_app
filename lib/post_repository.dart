import 'package:dio/dio.dart';
import 'api_client.dart';
import 'postModel.dart';

class PostRepository {
  final Dio _dio;

  PostRepository() : _dio = ApiClient().dio;

  Future<List<PostModel>> fetchPosts() async {
    final response = await _dio.get('/posts');
    final List data = response.data;
    return data.map((json) => PostModel.fromJson(json)).toList();
  }

  Future<PostModel ?> fetchPostDetails(int id) async {
    final response = await _dio.get('/posts/$id');
    return PostModel.fromJson(response.data);
  }

  Future<PostModel ?> createPost(Map<String, dynamic> data) async {
  try {
    final response = await _dio.post('/posts', data: data);
    return PostModel.fromJson(response.data); 
  } catch (e) {
    return null;  
  }
}

}
