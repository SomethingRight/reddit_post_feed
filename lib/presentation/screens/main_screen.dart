import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../logic/cubit/post_loader_cubit.dart';
import '../widgets/post_widget.dart';
import 'post_details_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reddit posts'),
          centerTitle: true,
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
              onRefresh: () =>
                  Provider.of<PostLoaderCubit>(context, listen: false)
                      .loadPosts(),
              child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push<PostLoaderCubit>(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostDetailsScreen(
                                    post: posts[index],
                                  ))),
                      child: PostWidget(post: posts[index]),
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


