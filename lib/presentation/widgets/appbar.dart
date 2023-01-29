import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/theme.dart';
import '../../logic/bloc/settings_bloc/settings_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return AppBar(
          title: Text(title),
          titleTextStyle: appThemeData[state.theme]!.textTheme.headline1,
          //state.themeData.textTheme.headline1, old theme bloc
          centerTitle: true,
          iconTheme:  appThemeData[state.theme]!.iconTheme,
          //state.themeData.iconTheme, old theme bloc
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
