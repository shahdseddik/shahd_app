import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import  'package:shahd_app/providers/theme_notifier.dart';

class ThemeDropdown extends ConsumerWidget {
  const ThemeDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return DropdownButton<ThemeMode>(
      value: themeMode,
      icon: const Icon(Icons.color_lens, color: Color.fromARGB(255, 193, 122, 251)),
      underline: const SizedBox(),
      items: const [
        DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
        DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
        DropdownMenuItem(value: ThemeMode.system, child: Text('System')),
      ],
      onChanged: (newMode) {
        if (newMode != null) {
          ref.read(themeProvider.notifier).setTheme(newMode);
        }
      },
    );
  }
}
