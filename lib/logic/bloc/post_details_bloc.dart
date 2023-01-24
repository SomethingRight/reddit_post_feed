import 'package:rxdart/rxdart.dart';
import '../../domain/api/repositiry_posts.dart';
import '../../domain/models/post.dart';

class PostDetailsBloc {
  PostDetailsBloc() {
    getPostNew();
  }

  final RepositoryPosts _repository = RepositoryPosts();
  final BehaviorSubject<PostsData> _subject = BehaviorSubject<PostsData>();

  void getPostNew() {
    _repository.getAllPosts().then((List<PostsData> postsList) {
      postsList.forEach((element) {
        if (postId == element.id) {
          return  _subject.sink.add(element);
        }
      });
    });
  }

  void setPostId(String postId){
    this.postId = postId;
  }

  void dispose() {
    _subject.close();
  }

  BehaviorSubject<PostsData> get subject => _subject;
  late String postId;
}
