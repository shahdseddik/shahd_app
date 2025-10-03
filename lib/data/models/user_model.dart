class UserModel {
  final String token;
  final String email;

  UserModel({required this.token, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] ?? '',  
      email: json['email'] ?? '',
    );
  }
}
