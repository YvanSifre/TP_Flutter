import '../data_sources/posts_data_source.dart';
import '../model/post.dart';

class PostsRepository{
  final PostsDataSource remoteDataSource;

  PostsRepository({
  required this.remoteDataSource
  });

  Future<List<Post>> getPosts() async {
    try {
      final posts = await remoteDataSource.getPosts();
      return posts;
    } catch (e) {
      rethrow;
    }
  }
  Future<void> addPost(String title, String description) async {
    try {
      await remoteDataSource.addPost(title, description);
    } catch (e) {
      rethrow;
    }
  }
}