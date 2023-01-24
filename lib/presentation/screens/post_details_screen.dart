import 'package:flutter/material.dart';
import '../../domain/api/repositiry_posts.dart';
import '../../domain/models/post.dart';
import '../../logic/bloc/post_details_bloc.dart';

class PostDetailsScreen extends StatefulWidget {

  const PostDetailsScreen({super.key, required this.postId});
  final String postId;

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  late final PostDetailsBloc bloc;
  @override
  void initState() {
    super.initState();

      
    bloc = PostDetailsBloc();
    bloc.setPostId(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.subject.stream,
        initialData: PostsData(authorName: 'loading', bodyText: '',title: ''),
        builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Offstage();
            } 
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
                              maxLines: 5,
                              style: const TextStyle(fontSize: 18)),
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
            });
          
         //return const Scaffold(body: Center(child: Text('something goes wrong')));
        
  }
}
