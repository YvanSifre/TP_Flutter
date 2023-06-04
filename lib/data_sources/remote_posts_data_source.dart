import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tp/data_sources/posts_data_source.dart';
import '../model/post.dart';

class RemotePostsDataSource extends PostsDataSource{

  @override
  Future<List<Post>> getPosts() async{
    final database = FirebaseFirestore.instance;
    final snapshot = await database.collection('posts').get();
    final posts = snapshot.docs.map((e) => Post.fromSnapshot (e)).toList();
    return posts;
  }

  @override
  Future<void> addPost(String title, String description) async {
    FirebaseFirestore.instance.collection('posts').add({
      'title': title,
      'description': description,
    });
  }
}