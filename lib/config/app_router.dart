import 'package:flutter/material.dart';
import '../presentation/screens/main_screen.dart';
import '../presentation/screens/post_details_screen.dart';
import '../presentation/screens/settings_screen.dart';

// ignore: avoid_classes_with_only_static_members
class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final dynamic arguments = settings.arguments;
    final String name = settings.name!;
    if (name == '/settings') {
      return MaterialPageRoute<dynamic>(
          builder: (context) => const SettingsScreen());
    }
    if (name == '/details') {
      final String postLink = arguments as String;
      return MaterialPageRoute<dynamic>(
          builder: (context) => PostDetailsScreen(
                postLink: postLink,
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
      ),
    );
  }
}
