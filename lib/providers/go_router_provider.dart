import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shahd_app/Screens/privacy_policy_screen.dart';
import 'package:shahd_app/screens/create_post_screen.dart';
import '../providers/auth_provider.dart';
import '../screens/login_screen.dart';
import '../screens/posts_screen.dart';
import '../screens/subjects_screen.dart';
import '../screens/post_details_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',

    redirect: (context, state) {
      final loggedIn = authState.isLoggedIn;
      final loggingIn = state.uri.toString() == '/login';

      if (!loggedIn && !loggingIn) return '/login';
      if (loggedIn && loggingIn) return '/home';
      return null;
    },

    routes: [
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(
        path: '/home',
        builder: (context, state) => PostsScreen(),
        routes: [
          GoRoute(
            path: 'subjects',
            builder: (context, state) => SubjectsScreen(),
          ),
          GoRoute(
            path: 'post-details/:postId',
            builder: (context, state) {
              final postIdString = state.pathParameters['postId']!;
              final postId = int.tryParse(postIdString) ?? 0;
              return PostDetailsScreen(postId: postId);
            },
          ),
          GoRoute(
            path: 'createPost',
            builder: (context, state) => CreatePostScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/privacy-policy',
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
    ],
  );
});
