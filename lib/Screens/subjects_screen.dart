
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/l10n/app_localizations.dart';
import 'package:shahd_app/widgets/app_drawer.dart';
import '../providers/subject_provider.dart';

class SubjectsScreen extends ConsumerWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsAsync = ref.watch(subjectsProvider);
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title:  Text(loc.subjects)),
      body: subjectsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (subjects) => 
        Expanded(child: 
        ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];
            
            return ListTile(
              leading: const Icon(Icons.book),
              title: Text(subject.name),
              subtitle: Text('ID: ${subject.id}'),
            );
          },
        ),
        )
      ),
      drawer: const AppDrawer(),
    );
  }
}
