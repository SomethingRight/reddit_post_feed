// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rxdart/rxdart.dart';

import '../../domain/api/api_client.dart';
import '../../domain/models/post.dart';

class PostBloc {
  PostsData initialPost = PostsData();
  BehaviorSubject<PostsData> subjectPost;
  final HttpRequest request;

  PostBloc(this.request, {
    required this.subjectPost,
  }) {
    subjectPost = BehaviorSubject.seeded(initialPost);
  }

  Stream<PostsData> get postStream => subjectPost.stream ;

  Future<void> getPost() async {
    final response = await request.getPosts();
    return subjectPost.sink.add(initialPost);
  }

  void dispose(){
    subjectPost.close();
  }
}
