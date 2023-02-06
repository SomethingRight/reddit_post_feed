import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../../../domain/api/post_details_api.dart';
import '../../../domain/models/post_details.dart';

@injectable
class PostDetailsBloc {
  PostDetailsBloc({required this.repository});

  final PostDetailsApi repository;
  final BehaviorSubject<PostsDetailsData> _subject =
      BehaviorSubject<PostsDetailsData>();

  void init(String postLinked) {
    this.postLinked = postLinked;
    getPost();
  }

  void getPost() {
    repository.getPostDetails(postLinked).then((PostsDetailsData postData) {
      _subject.sink.add(postData);
    });
  }

  void dispose() {
    _subject.close();
  }

  BehaviorSubject<PostsDetailsData> get subject => _subject;
  late String postLinked;
}
