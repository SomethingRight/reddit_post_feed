import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/theme.dart';
import '../../logic/bloc/theme_bloc/theme_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return AppBar(
          title: Text(title),
          titleTextStyle: state.themeData.textTheme.headline1,
          centerTitle: true,
          iconTheme: state.themeData.iconTheme,
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                icon: const Icon(
                  Icons.settings,
                ))
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
