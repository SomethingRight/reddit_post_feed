// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/post.dart';
import '../../logic/bloc/share/share_bloc.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({
    Key? key,
     this.post,
  }) : super(key: key);

  final PostsData? post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(post!.authorName.toString(),
              style: const TextStyle(fontSize: 20))),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  post!.title.toString(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (post!.isImage != null) ...[
                  SizedBox(
                      width: 300,
                      height: 200,
                      child: Image.network(
                        post!.imageUrl.toString(),
                        fit: BoxFit.cover,
                      ))
                ],
                Text(post!.bodyText.toString(),
                    maxLines: 5, style: const TextStyle(fontSize: 18)),
              ],
            ),
            InkWell(
              onTap: () {
                //  final String message = 'Share this link: ${post.link.toString()}';
                //  Share.share(message);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.share),
                    Text(
                      'SHARE THIS POST',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

