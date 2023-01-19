import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/api/api_client.dart';
import '../../domain/models/post.dart';

part 'post_loader_state.dart';

class PostLoaderCubit extends Cubit<PostLoaderState> {
  PostLoaderCubit(this.request) : super(const PostLoading());
  final HttpRequest request;

  Future<void> loadPosts() async {
    emit(const PostLoading());
    final response = await request.getPosts();
    emit (PostLoaded(posts: response));
  }
}
