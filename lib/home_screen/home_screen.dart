import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../model/post.dart';
import '../new_post_screen.dart';
import '../post_detail_screen/post_detail_screen.dart';
import '../posts_bloc/posts_bloc.dart';
import '../repository/posts_repository.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PostsBloc(
          repository: RepositoryProvider.of<PostsRepository>(context),
        )..add(
          GetAllPosts(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            try{
              switch (state.status) {
                case PostsStatus.initial:
                  return const SizedBox();
                case PostsStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case PostsStatus.error:
                  return Center(
                    child: Text(state.error),
                  );
                case PostsStatus.success:
                  final posts = state.posts;
                  if (posts.isEmpty) {
                    return const Center(
                      child: Text('Aucun post'),
                    );
                  }
                  return SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    onRefresh: () async {
                      final PostsBloc postBloc = BlocProvider.of<PostsBloc>(context);
                      postBloc.add(GetAllPosts());
                      _refreshController.refreshCompleted();
                    },
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          if (post.title != null && post.description != null) {
                            return GestureDetector(
                              onTap: () => _onPostTap(context, post),
                              child: ListTile(
                                title: Text(post.title),
                                subtitle: Text(post.description),
                              ),
                            );
                          }
                        },
                      ),
                  );
              }
            } catch(error){
              throw Exception(error);
             }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewPostScreen()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _onPostTap(BuildContext context, Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostDetailScreen(post: post),
      ),
    );
  }
}
