part of 'post_loader_cubit.dart';


abstract class PostLoaderState {
  const PostLoaderState({required this.isLoaded});
  
  final bool isLoaded;
}

class PostLoadingState extends PostLoaderState {
  const PostLoadingState({super.isLoaded = false});
}

class PostLoadedState extends PostLoaderState {
  PostLoadedState({super.isLoaded = true,required this.posts});

  List<PostsData> posts;
}
