import 'package:flutter/material.dart';
import '../../domain/models/post.dart';
import '../../logic/bloc/post_bloc.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({
    Key? key,
    this.bloc,
  }) : super(key: key);

  final PostBloc? bloc;

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<PostsData>(
        stream: bloc?.postStream,
        builder: (context, snapshot) {
          while (arg == bloc?.postStream.singleWhere((element) => snapshot.data?.id == arg))  {
            return Scaffold(
              appBar: AppBar(
                  title: Text(snapshot.data!.authorName.toString(),
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
                          snapshot.data!.title.toString(),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (snapshot.data!.isImage != null) ...[
                          SizedBox(
                              width: 300,
                              height: 200,
                              child: Image.network(
                                snapshot.data!.imageUrl.toString(),
                                fit: BoxFit.cover,
                              ))
                        ],
                        Text(snapshot.data!.bodyText.toString(),
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }  {
            return const Scaffold(
              body: Center(
                child: Text('something went wrong'),
              ),
            );
          }
        });
  }
}
