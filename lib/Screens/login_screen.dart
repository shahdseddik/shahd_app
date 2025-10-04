import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/l10n/app_localizations.dart';
import 'package:shahd_app/providers/auth_provider.dart';
import 'package:shahd_app/widgets/language_selector.dart';
import 'package:shahd_app/widgets/theme_dropdown.dart';
import 'posts_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      await ref.read(authProvider.notifier).login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (!mounted) return;
      if (ref.read(authProvider).isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const PostsScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.posts),
        actions: [
          const ThemeDropdown(),
          const LanguageSelector(),
  ],
),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: loc.email),
                  validator: (value) => value!.isEmpty ? loc.enterEmail : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: loc.password),
                  obscureText: true,
                  validator: (value) => value!.isEmpty ? loc.enterPassword : null,
                ),
                const SizedBox(height: 20),
                authState.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _login,
                        child: Text(loc.submit),
                      ),
                if (authState.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      authState.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
