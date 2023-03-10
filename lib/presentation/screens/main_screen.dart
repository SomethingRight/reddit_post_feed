import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../logic/cubit/post_loader_cubit.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: AppLocalizations.of(context)!.redditFeed),
        body: BlocBuilder<PostLoaderCubit, PostLoaderState>(
            builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoadedState) {
            final posts = state.posts;
            return RefreshIndicator(
              onRefresh: () =>
                  Provider.of<PostLoaderCubit>(context, listen: false)
                      .loadPosts(),
              child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.pushNamed(context, '/details',
                          arguments: posts[index].link
                          ),
                      child: PostWidget(post: posts[index]),
                    );
                  }),
            );
          } else {
            final Error error = ArgumentError(AppLocalizations.of(context)!.errorMessage);
            throw error;
          }
        }));
  }
}
