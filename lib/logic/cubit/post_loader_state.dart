part of 'post_loader_cubit.dart';


abstract class PostLoaderState {
  const PostLoaderState({required this.isLoaded});
  
  final bool isLoaded;
}

class PostLoading extends PostLoaderState {
  const PostLoading({super.isLoaded = false});
}

class PostLoaded extends PostLoaderState {
  PostLoaded({super.isLoaded = true,required this.posts});

  List<PostsData> posts;
}
