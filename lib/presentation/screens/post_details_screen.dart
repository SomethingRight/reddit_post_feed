import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/theme.dart';
import '../../domain/models/post_details.dart';
import '../../logic/bloc/post_details_bloc/post_details_bloc.dart';
import '../widgets/widgets.dart';

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
    bloc = PostDetailsBloc(widget.postLink);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.subject.stream,
        initialData: PostsDetailsData(
            authorName: '',
            bodyText: '',
            title: 'loading...',
            imageUrl: '',
            link: ''),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Offstage();
          }
          return Scaffold(
            appBar: const CustomAppBar(title: '') ,
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
                          Text(
                            'Posted by: ',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            '${snapshot.data?.authorName}',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        snapshot.data!.title.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                          onPressed: () async {
                            final Uri url =
                                Uri.parse(snapshot.data?.link as String);

                            if (await canLaunchUrl(url)) {
                              await launchUrl(url,
                                  mode: LaunchMode.inAppWebView);
                            }
                          },
                          child: Text(
                            '${snapshot.data?.link}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      if (snapshot.data!.isImage != null) ...[
                        SizedBox(
                            width: 300,
                            height: 200,
                            child: Image.network(
                              snapshot.data!.imageUrl.toString(),
                              fit: BoxFit.cover,
                            ))
                      ],
                      const SizedBox(
                        height: 15,
                      ),
                      Text(snapshot.data!.bodyText.toString(),
                          maxLines: 5,
                          style: Theme.of(context).textTheme.bodyText1),
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
                        children: [
                          const Icon(Icons.share),
                          Text(
                            'SHARE THIS POST',
                            style: Theme.of(context).textTheme.headline2,
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
  }
}
