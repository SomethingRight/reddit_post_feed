import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../domain/api/api_client.dart';
import '../../logic/cubit/post_loader_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reddit posts'),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Provider.of<PostLoaderCubit>(context, listen: false)
          //             .loadPosts();
          //       },
          //       icon: const Icon(Icons.refresh))
          // ],
        ),
        body: BlocBuilder<PostLoaderCubit, PostLoaderState>(
          builder: (context, state) {
          if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoaded) {
            final posts = state.posts;
            return RefreshIndicator(
              onRefresh: () => Provider.of<PostLoaderCubit>(context, listen: false).loadPosts(),
              child: ListView.builder(
                  itemExtent: MediaQuery.of(context).size.height / 5,
                  shrinkWrap: true,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.black12,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (posts[index].title != null) ...[
                            Text(
                              '${posts[index].title}',
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                          const SizedBox(
                            height: 10,
                          ),
                          if (posts[index].isImage != null) ...[
                            SizedBox(
                              width: 100,
                              height: 60,
                              child: Image.network('${posts[index].imageUrl}'),
                            ),
                          ]
                        ],
                      ),
                    );
                  }),
            );
          } else {
            final Error error = ArgumentError('Something went wrong!');
            throw error;
          }
        }));
  }
}
