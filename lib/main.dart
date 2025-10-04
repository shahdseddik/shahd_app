import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/Screens/login_screen.dart';
import 'package:shahd_app/l10n/app_localizations.dart';
import 'package:shahd_app/providers/auth_provider.dart';
import 'package:shahd_app/providers/locale_notifier.dart';
import 'package:shahd_app/providers/theme_notifier.dart';
import 'Screens/posts_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(localeNotifierProvider);
    final authState = ref.watch(authProvider);

    
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), 
          Locale('ar', ''), 
        ],
        locale: locale,
        title: 'Theme',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
        home: authState.isLoggedIn
            ? const PostsScreen()
            : const LoginScreen(),
    );
  }
}
