import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp/posts_bloc/posts_bloc.dart';
import 'package:tp/repository/posts_repository.dart';

import 'model/post.dart';

class NewPostScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(
        repository: RepositoryProvider.of<PostsRepository>(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nouveau post'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Titre',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _createPost(context),
                child: Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createPost(BuildContext context) {
    final String title = titleController.text;
    final String description = descriptionController.text;

    if (!title.isEmpty && !description.isEmpty) {
      BlocProvider.of<PostsBloc>(context).add(AddPost(title, description));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Post ajouté'),
      ));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Veuillez remplir tous les champs'),
      ));
    }
  }

}
