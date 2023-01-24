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
      this.ups,
      this.imageUrl,
      this.isImage});

  String? bodyText;
  String? authorName;
  String? id;
  String? title;
  int? ups;
  String? imageUrl;
  int? isImage;

  factory PostsData.fromJson(Map<String, dynamic> json) => PostsData(
        bodyText: json['selftext'] as String?,
        authorName: json['author'] as String?,
        id: json['id'] as String?,
        title: json['title'] as String?,
        ups: json['ups'] as int?,
        imageUrl: json['thumbnail'] as String?,
        isImage: json['thumbnail_height'] as int?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'selftext': bodyText,
        'author': authorName,
        'id' : id,
        'title': title,
        'ups': ups,
        'thumbnail': imageUrl,
        'thumbnail_height': isImage,
      };
      
        @override
        // TODO: implement props
        List<Object?> get props => [id, title, bodyText, isImage, imageUrl, authorName, ups];
}
