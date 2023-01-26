import 'package:rxdart/rxdart.dart';
import '../../domain/api/api_post_details.dart';
import '../../domain/models/post_details.dart';

class PostDetailsBloc {
  PostDetailsBloc(this.postLinked) {
    getPost();
  }

  final HttpPostDetailsRequest _repository = HttpPostDetailsRequest();
  final BehaviorSubject<PostsDetailsData> _subject = BehaviorSubject<PostsDetailsData>();

  void getPost() {
    _repository.getPostDetails(postLinked)
    .then((PostsDetailsData postData) {
      _subject.sink.add(postData);
      });
  }

  void dispose() {
    _subject.close();
  }

  BehaviorSubject<PostsDetailsData> get subject => _subject;
  String postLinked;
}
