import '../model/post.dart';

abstract class PostsDataSource {
  Future<List<Post>> getPosts();
  Future<void> addPost (String title, String description);
}