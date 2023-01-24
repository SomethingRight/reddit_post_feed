import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/api/api_posts.dart';
import 'logic/cubit/post_loader_cubit.dart';
import 'presentation/screens/main_screen.dart';
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
        onGenerateRoute: (RouteSettings settings) {
          final dynamic arguments = settings.arguments;
          final String? name = settings.name;
          if (name == '/details') {
            final String postId = arguments as String;
            return MaterialPageRoute<dynamic>(
                builder: (context) => PostDetailsScreen(
                      postId: postId,
                    ));
          } else if (name == '/') {
            return MaterialPageRoute<dynamic>(
                builder: (context) => const MainScreen());
          }
          return MaterialPageRoute<dynamic>(
              builder: (context) => const Scaffold(
                    body: Center(
                      child: Text('wrong route'),
                    ),
                  ));
        },
      ),
    );
  }
}
