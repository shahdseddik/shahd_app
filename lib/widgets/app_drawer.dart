import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shahd_app/l10n/app_localizations.dart';
import 'package:shahd_app/providers/auth_provider.dart';
import 'package:shahd_app/widgets/language_selector.dart';
import 'package:shahd_app/widgets/theme_dropdown.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 200, 149, 255)),
            child: Text(
              loc.list,
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: Text(loc.posts),
            onTap: () {
              Navigator.pop(context);
              context.go('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: Text(loc.subjects),
            onTap: () {
              Navigator.pop(context);
              context.go('/home/subjects');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text(loc.createPost),
            onTap: () {
              Navigator.pop(context);
              context.go('/home/createPost');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(loc.logout),
            onTap: () async{
              Navigator.pop(context);
              await ref.read(authProvider.notifier).logout();
              if (!context.mounted) return;
              context.go('/login');
            },
          ),
          const Divider(),

          // Theme Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                const ThemeDropdown(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                const LanguageSelector(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
