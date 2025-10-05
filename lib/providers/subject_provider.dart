import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahd_app/data/api_client.dart';
import 'package:shahd_app/data/repositories/subject_repository.dart';
import '../data/models/subject_model.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(baseUrl: 'https://almadinaglobal.org');
});

final subjectRepositoryProvider = Provider<SubjectRepository>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return SubjectRepository(apiClient: apiClient);
});

final subjectsProvider = FutureProvider<List<Subject>>((ref) async {
  final repository = ref.read(subjectRepositoryProvider);
  return repository.fetchSubjects();
});
