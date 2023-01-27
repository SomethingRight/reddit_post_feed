import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_router.dart';
import 'config/theme.dart';
import 'domain/api/api_posts.dart';
import 'logic/bloc/theme_bloc/theme_bloc.dart';
import 'logic/cubit/post_loader_cubit.dart';

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
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Test App Reddit Posts',
            theme: state.themeData,
            initialRoute: '/',
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
