import 'package:flutter/material.dart';
import '../../domain/models/post.dart';
import '../../domain/models/post_details.dart';
import '../../logic/bloc/post_details_bloc.dart';

class PostDetailsScreen extends StatefulWidget {

  const PostDetailsScreen({super.key, required this.postLink});
  final String postLink;

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  late final PostDetailsBloc bloc;
  @override
  void initState() {
    super.initState();

    bloc = PostDetailsBloc(widget.postLink);
    //bloc.setPostLink(widget.postLink);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.subject.stream,
        initialData: PostsDetailsData(authorName: '', bodyText: '',title: 'loading...', imageUrl: '', link: ''),
        builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Offstage();
            } 
              return Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Posted by: ', style: TextStyle(fontSize: 20),),
                              Text('${snapshot.data?.authorName}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            snapshot.data!.title.toString(),
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(height: 10),
                          TextButton(onPressed: (){}, child: Text('${snapshot.data?.link}')),
                          
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
