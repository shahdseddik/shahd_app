import 'package:dio/dio.dart';
import 'api_client.dart';

class PostRepository {
  final Dio _dio;

  PostRepository() : _dio = ApiClient().dio;

  Future<List<dynamic>> fetchPosts() async {
    final response = await _dio.get('/posts');
    return response.data;
  }

  Future<Map<String, dynamic>> fetchPostDetails(int id) async {
    final response = await _dio.get('/posts/$id');
    return response.data;
  }

  Future<Map<String, dynamic>?> createPost(Map<String, dynamic> data) async {
  try {
    final response = await _dio.post('/posts', data: data);
    return response.data;  
  } catch (e) {
    return null;  
  }
}

}
