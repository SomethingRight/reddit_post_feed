import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test_app_reddit_get_posts/domain/models/post.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  Future<List<PostsData>> getPosts() async {
    final http.Response response =
        await http.get(Uri.parse('https://reddit.com/r/flutterdev/new.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> resp =
          json.decode(response.body) as Map<String, dynamic>;
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
