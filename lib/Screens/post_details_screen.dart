import 'package:flutter/material.dart';
import 'package:shahd_app/api_client.dart'; 

class PostDetailsScreen extends StatefulWidget {
  final int postId; 

  const PostDetailsScreen({super.key, required this.postId});

  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  ApiClient apiClient = ApiClient();       
  Map<String, dynamic>? post;               
  bool isLoading = true;                     

  @override
  void initState() {
    super.initState();
    fetchPostDetails(); 
  }

  
  Future<void> fetchPostDetails() async {
    final data = await apiClient.getPostDetails(widget.postId);
    setState(() {
      post = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : post == null
              ? const Center(child: Text('Post not found'))  
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post!['title'],
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        post!['body'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
    );
  }
}
