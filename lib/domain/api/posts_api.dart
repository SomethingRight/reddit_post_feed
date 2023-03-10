import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '/domain/models/post.dart';

@injectable
class PostsApi implements PostsApiI{
  @override
  Future<List<PostsData>> getPosts() async {
    final Dio dio = Dio();
    final  response =
        await dio.get<String>('https://reddit.com/r/flutterdev/new.json');
    if (response.statusCode == 200) {
      final Map<String, dynamic> resp =
          json.decode(response.data!) as Map<String, dynamic>;
      final List<dynamic> postJson = resp['data']['children'] as List<dynamic>;
      final List<PostsData> posts = postJson
          .map((dynamic e) =>
              PostsData.fromJson(e['data'] as Map<String, dynamic>))
          .toList();
      return posts;
    } else {
      final Error error = ArgumentError('Something went wrong!');
      throw error;
    }
  }
}

abstract class PostsApiI {
   Future<List<PostsData>> getPosts();
}
