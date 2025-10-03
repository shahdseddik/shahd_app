import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shahd_app/config/app_config.dart';
import 'package:shahd_app/data/api_client.dart';
import 'package:shahd_app/data/repositories/auth_repository.dart';
import 'package:shahd_app/data/repositories/post_repository.dart';
import 'package:shahd_app/data/storage/secure_storage.dart';


class AuthState {
  final bool isLoading;
  final bool isLoggedIn;
  final String? errorMessage;

  AuthState({this.isLoading = false, this.isLoggedIn = false, this.errorMessage});

  AuthState copyWith({bool? isLoading, bool? isLoggedIn, String? errorMessage}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      errorMessage: errorMessage,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier(this.authRepository) : super(AuthState()){
    _checkLoginStatus();
  }
  Future<void> _checkLoginStatus() async {
    final token = await SecureStorage.readToken();
    if (token != null) {
      state = state.copyWith(isLoggedIn: true);
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final user = await authRepository.login(email, password);
      if (user != null) {
        state = state.copyWith(isLoading: false, isLoggedIn: true);
      } else {
        state = state.copyWith(isLoading: false, errorMessage: "Invalid credentials");
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
final authApiClientProvider = Provider((ref) => ApiClient(baseUrl: AppConfig.authBaseUrl));
final postsApiClientProvider = Provider((ref) => ApiClient(baseUrl: AppConfig.postsBaseUrl));

final authRepositoryProvider = Provider((ref) => AuthRepository(apiClient: ref.read(authApiClientProvider)));
final postsRepositoryProvider = Provider((ref) => PostsRepository(apiClient: ref.read(postsApiClientProvider)));

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.read(authRepositoryProvider)),
);