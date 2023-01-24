import '../models/post.dart';
import 'api_posts.dart';

class RepositoryPosts {
  final HttpRequest _postsProvider = HttpRequest();
  Future<List<PostsData>> getAllPosts() => _postsProvider.getPosts();
}