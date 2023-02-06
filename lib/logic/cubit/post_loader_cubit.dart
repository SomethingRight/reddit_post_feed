import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/api/posts_api.dart';
import '../../domain/models/post.dart';

part 'post_loader_state.dart';

@injectable
class PostLoaderCubit extends Cubit<PostLoaderState> {
  PostLoaderCubit(this.request) : super(const PostLoadingState()) {
    loadPosts().then((value) => null);
  }
  final PostsApi request;

  Future<void> loadPosts() async {
    emit(const PostLoadingState());
    final response = await request.getPosts();
    emit(PostLoadedState(posts: response));
  }
}
