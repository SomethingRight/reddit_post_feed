import 'dart:convert';

import 'package:equatable/equatable.dart';

// "data(PostData)" -> "children(Child)" -> "data(ChildData)" -> "title" , "ups", "thumbnail", "author", "selftext"

// ignore: must_be_immutable
class PostsData extends Equatable{
  PostsData(
      {this.bodyText,
      this.authorName,
      this.id,
      this.title,
      this.link,
      this.imageUrl,
      this.isImage});

  String? bodyText;
  String? authorName;
  String? id;
  String? title;
  String? link;
  String? imageUrl;
  int? isImage;

  factory PostsData.fromJson(Map<String, dynamic> json) => PostsData(
        bodyText: json['selftext'] as String?,
        authorName: json['author'] as String?,
        id: json['id'] as String?,
        title: json['title'] as String?,
        link: json['permalink'] as String?,
        imageUrl: json['thumbnail'] as String?,
        isImage: json['thumbnail_height'] as int?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'selftext': bodyText,
        'author': authorName,
        'id' : id,
        'title': title,
        'permalink': link,
        'thumbnail': imageUrl,
        'thumbnail_height': isImage,
      };
      
        @override
        // TODO: implement props
        List<Object?> get props => [id, title, bodyText, isImage, imageUrl, authorName, link];
}
