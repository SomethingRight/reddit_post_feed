import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post_details.dart';



class HttpPostDetailsRequest {
  Future<PostsDetailsData> getPostDetails(String currentPostLink) async {
    final http.Response response =
        await http.get(Uri.parse('https://www.reddit.com$currentPostLink.json'));
    if (response.statusCode == 200) {
      final List<dynamic> resp =
          json.decode(response.body) as List<dynamic>;
      final dynamic postInfo = resp[0];
      final List<dynamic> postJson = postInfo['data']['children'] as List<dynamic>;
      final PostsDetailsData post = PostsDetailsData.fromJson(postJson.first['data'] as Map<String, dynamic>);
      return post;
    } else {
      final Error error = ArgumentError('Something went wrong!');
      throw error;
    }
  }

}
