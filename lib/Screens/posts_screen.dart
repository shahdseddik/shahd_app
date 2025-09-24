import 'package:flutter/material.dart';
import 'package:shahd_app/Screens/post_details_screen.dart';
import 'package:shahd_app/api_client.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<PostsScreen> {
  ApiClient apiClient = ApiClient(); 
  List<dynamic> posts = [];          
  bool isLoading = true;             

  @override
  void initState() {
    super.initState();
    fetchPosts(); 
  }

  
  Future<void> fetchPosts() async {
    final data = await apiClient.getPosts();
    setState(() {
      posts = data;
      isLoading = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) 
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index]; 
                return ListTile(
                  title: Text(post['title']),
                  onTap: () {
                  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostDetailsScreen(postId: post['id']),
      ),
    );
                  },
                );
              },
            ),
    );
  }
}