import 'dart:convert';

// "data(PostData)" -> "children(Child)" -> "data(ChildData)" -> "title" , "ups", "thumbnail", "author", "selftext"

class PostsData {
  PostsData(
      {this.bodyText,
      this.authorName,
      this.link,
      this.title,
      this.ups,
      this.imageUrl,
      this.isImage});

  String? bodyText;
  String? authorName;
  String? link;
  String? title;
  int? ups;
  String? imageUrl;
  int? isImage;

  factory PostsData.fromJson(Map<String, dynamic> json) => PostsData(
        bodyText: json['selftext'] as String?,
        authorName: json['author'] as String?,
        link: json['url'] as String?,
        title: json['title'] as String?,
        ups: json['ups'] as int?,
        imageUrl: json['thumbnail'] as String?,
        isImage: json['thumbnail_height'] as int?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'selftext': bodyText,
        'author': authorName,
        'url' : link,
        'title': title,
        'ups': ups,
        'thumbnail': imageUrl,
        'thumbnail_height': isImage,
      };
}
