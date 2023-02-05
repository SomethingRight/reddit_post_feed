import 'package:rxdart/rxdart.dart';
import '../../../domain/api/post_details_api.dart';
import '../../../domain/models/post_details.dart';


class PostDetailsBloc {
  PostDetailsBloc({required this.repository});

  final PostDetailsApiI repository;
  final BehaviorSubject<PostsDetailsData> _subject =
      BehaviorSubject<PostsDetailsData>();

  void getPost() {
    repository.getPostDetails(postLinked).then((PostsDetailsData postData) {
      _subject.sink.add(postData);
    });
  }

  void dispose() {
    _subject.close();
  }

  void init(String postLinked){
    this.postLinked = postLinked;
     getPost();
  }

  BehaviorSubject<PostsDetailsData> get subject => _subject;
  late String postLinked;
}
