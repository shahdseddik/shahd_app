import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(
          BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
        );

  Dio get dio => _dio;
}
