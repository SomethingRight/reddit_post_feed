import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/theme.dart';
import '../../domain/models/post_details.dart';
import '../../logic/bloc/post_details_bloc/post_details_bloc.dart';
import '../../logic/bloc/settings_bloc/settings_bloc.dart';
import '../widgets/widgets.dart';

//TODO
    //create method inside bloc ,
    //look at GetIT library , run app in web

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
    
    //bloc.init(widget.postLink);
    bloc = PostDetailsBloc(widget.postLink);
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
            appBar: const CustomAppBar(title: ''),
            body: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return Padding(
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
                                style: appThemeData[state.theme]!
                                    .textTheme
                                    .headline3!
                                    .copyWith(fontSize: state.newFontSize),
                              ),
                              Flexible(
                                child: Text(
                                  '${snapshot.data?.authorName}',
                                  style: appThemeData[state.theme]!
                                      .textTheme
                                      .headline2!
                                      .copyWith(fontSize: state.newFontSize),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            snapshot.data!.title.toString(),
                            style: appThemeData[state.theme]!
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: state.newFontSize),
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
                                style: TextStyle(fontSize: state.newFontSize),
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
                              style: appThemeData[state.theme]!
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: state.newFontSize)),
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
                              Icon(
                                Icons.share,
                                color: appThemeData[state.theme]!.splashColor,
                              ),
                              Text(
                                'SHARE THIS POST',
                                style: appThemeData[state.theme]!
                                    .textTheme
                                    .headline4,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
