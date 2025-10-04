import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/l10n/app_localizations.dart';
import  'package:shahd_app/providers/theme_notifier.dart';

class ThemeDropdown extends ConsumerWidget {
  const ThemeDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final loc = AppLocalizations.of(context)!;

    return DropdownButton<ThemeMode>(
      value: themeMode,
      icon: const Icon(Icons.color_lens, color: Color.fromARGB(255, 193, 122, 251)),
      underline: const SizedBox(),
      items:[
        DropdownMenuItem(value: ThemeMode.light, child: Text(loc.light)),
        DropdownMenuItem(value: ThemeMode.dark, child: Text(loc.dark)),
        DropdownMenuItem(value: ThemeMode.system, child: Text(loc.system)),
      ],
      onChanged: (newMode) {
        if (newMode != null) {
          ref.read(themeProvider.notifier).setTheme(newMode);
        }
      },
    );
  }
}
