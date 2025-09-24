import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://jsonplaceholder.typicode.com/',
          ),
        );


  Future<List<dynamic>> getPosts() async {
    try {
      Response response = await _dio.get('/posts');
      return response.data; 
    } catch (e) {
      print('Error fetching posts: $e');
      return [];
    }
  }


  Future<Map<String, dynamic>?> getPostDetails(int postId) async {
    try {
      Response response = await _dio.get('/posts/$postId');
      return response.data; 
    } catch (e) {
      print('Error fetching post details: $e');
      return null;
    }
  }
}
