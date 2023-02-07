

import 'package:flutter/material.dart';

import '../../domain/models/post.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostsData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.black12,),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (post.title != null) ...[
            Text(
              '${post.title}',
              maxLines: 2,
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
          const SizedBox(
            height: 10,
          ),
          if (post.isImage != null) ...[
            SizedBox(
              width: 100,
              height: 60,
              child:
                  Image.network('${post.imageUrl}'),
            ),
          ]
        ],
      ),
    );
  }
}