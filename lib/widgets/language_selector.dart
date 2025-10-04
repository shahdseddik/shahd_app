import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/l10n/app_localizations.dart';
import 'package:shahd_app/providers/locale_notifier.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeNotifierProvider);
    final loc = AppLocalizations.of(context)!;
    
    return DropdownButton<String>(
      value: locale.languageCode,
      onChanged: (value) {
        if (value != null) {
          ref.read(localeNotifierProvider.notifier).setLocale(value);
        }
      },
      items: [
        DropdownMenuItem(
          value: 'en',
          child: Text(loc.english),
        ),
        DropdownMenuItem(
          value: 'ar',
          child: Text(loc.arabic),
        ),
      ],
    );
  }
}
