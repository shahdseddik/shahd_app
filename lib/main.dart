import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/l10n/app_localizations.dart';
import 'package:shahd_app/providers/go_router_provider.dart';
import 'package:shahd_app/providers/locale_notifier.dart';
import 'package:shahd_app/providers/theme_notifier.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(localeNotifierProvider);
    final router = ref.watch(routerProvider); 

    
        return MaterialApp.router(
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
        routerConfig: router,

    );
  }
}
