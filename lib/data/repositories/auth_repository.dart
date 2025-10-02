import 'package:dio/dio.dart';
import 'package:shahd_app/data/api_client.dart';
import 'package:shahd_app/data/models/user_model';
import 'package:shahd_app/data/storage/scure_storage.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<UserModel?> login(String emailOrSerial, String password, {String? fcmToken}) async {
  try {
    final formData = FormData.fromMap({
      "email_or_serial_number": emailOrSerial,
      "password": password,
      if (fcmToken != null) "fcm_token": fcmToken,
    });

    final response = await apiClient.dio.post(
      "/api/login",
      data: formData,
      options: Options(
        headers: {
          "Accept": "application/json",
        },
      ),
    );

    if (response.statusCode == 200 && response.data['token'] != null) {
      await SecureStorage.writeToken(response.data['token']);
      return UserModel.fromJson(response.data);
    }

    return null;
  } catch (e) {
    if (e is DioException) {
    }
    throw Exception("Login failed: $e");
  }
}

}
