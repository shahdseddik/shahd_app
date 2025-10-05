import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/data/models/post_model.dart';
import 'package:shahd_app/l10n/app_localizations.dart';
import 'package:shahd_app/providers/post_providers.dart';
import 'package:shahd_app/widgets/app_drawer.dart';


class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({super.key});

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  
  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> _submitPost() async {
    final data = {
      "title": _titleController.text,
      "body": _bodyController.text,
      "userId": 1,
    };

    setState(() {
      _isLoading = true;
    });

    final PostModel? post = await ref.read(postRepositoryProvider).createPost(data);

    if (!mounted) return; 
    setState(() {
      _isLoading = false;
    });
    final loc = AppLocalizations.of(context)!; 
    if (post != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(loc.postCreated)));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(loc.failedToCreatePost)));
    }
  }

  @override
  Widget build(BuildContext context) {
  final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.createPost)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: loc.title),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: loc.body),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _submitPost,
                    child: Text(loc.submit),
                  ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}