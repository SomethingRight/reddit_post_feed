import 'dart:convert';

import 'package:equatable/equatable.dart';

// "data(PostData)" -> "children(Child)" -> "data(ChildData)" -> "title" , "ups", "thumbnail", "author", "selftext"

// ignore: must_be_immutable
class PostsData extends Equatable{
  PostsData(
      {this.title,
      this.link,
      this.imageUrl,
      this.isImage});

  factory PostsData.fromJson(Map<String, dynamic> json) => PostsData(
        title: json['title'] as String?,
        link: json['permalink'] as String?,
        imageUrl: json['thumbnail'] as String?,
        isImage: json['thumbnail_height'] as int?,
      );

  String? title;
  String? link;
  String? imageUrl;
  int? isImage;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'permalink': link,
        'thumbnail': imageUrl,
        'thumbnail_height': isImage,
      };
      
        @override
        List<Object?> get props => [ title, isImage, imageUrl, link];
}


PostsData nova = PostsData();

