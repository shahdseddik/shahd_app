import 'package:flutter/material.dart';
import 'package:shahd_app/Screens/posts_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dio API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostsScreen(), 
    );
  }
}

