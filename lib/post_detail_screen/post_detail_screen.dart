import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du post'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Titre: ${post.title}'),
            Text('Description: ${post.description}'),
          ],
        ),
      ),
    );
  }
}
