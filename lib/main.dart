import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app_reddit_get_posts/presentation/screens/main_screen.dart';
import 'package:http/http.dart' as http;

import 'domain/api/api_client.dart';
import 'logic/bloc/post_bloc.dart';
import 'logic/cubit/post_loader_cubit.dart';
import 'presentation/screens/post_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostLoaderCubit>(
          create: (context) => PostLoaderCubit(HttpRequest())..loadPosts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Test App Reddit Posts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes:  {
          '/' :(context) => const MainScreen(),
          '/details' :(context) => const PostDetailsScreen(),
        },
      ),
    );
  }
}
