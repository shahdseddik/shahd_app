import 'package:shahd_app/data/api_client.dart';
import 'package:shahd_app/data/models/subject_model.dart';

class SubjectRepository {
  final ApiClient apiClient;

  SubjectRepository({required this.apiClient});

  Future<List<Subject>> fetchSubjects() async {
    try {
      final response = await apiClient.dio.get('/api/student/my-subjects');

      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (jsonData['subjects'] is List) {
          final subjectsList = jsonData['subjects'] as List;
          return subjectsList.map((subject) => Subject.fromJson(subject)).toList();
        } else {
          throw Exception('Subjects data is missing or invalid');
        }
      } else {
        throw Exception('Failed to load subjects: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch subjects: $e');
    }
  }
}
