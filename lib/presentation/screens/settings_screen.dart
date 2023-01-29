// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../config/theme.dart';
import '../../logic/bloc/settings_bloc/settings_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('settings'),
            titleTextStyle: appThemeData[state.theme]!.textTheme.headline1,
            iconTheme: appThemeData[state.theme]!.iconTheme,
          ),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Сhoose an app theme:',
                        style: appThemeData[state.theme]!.textTheme.bodyText2),
                    SwitchListTile(
                        title: Text('Colored',
                            style:
                                appThemeData[state.theme]!.textTheme.bodyText1),
                        value: toggledColor,
                        activeColor: appThemeData[state.theme]!.splashColor,
                        secondary: const Icon(Icons.color_lens),
                        selected: toggledColor,
                        onChanged: (value) {
                           setState(() {
                          toggledColor = value ? true : false;
                            toggledDark = !(toggledDark = true);
                            toggledLight = !(toggledLight = true);


                          Provider.of<SettingsBloc>(context, listen: false).add(
                              const ThemeChanged(
                                  theme: AppTheme.colorTheme,
                                  ));
                          });
                        }),
                    SwitchListTile(
                        title: Text('Light',
                            style:
                                appThemeData[state.theme]!.textTheme.bodyText1),
                        value: toggledLight,
                        activeColor: appThemeData[state.theme]!.splashColor,
                        secondary: const Icon(Icons.light_mode),
                        selected: toggledLight,
                        onChanged: (value) {
                           setState(() {
                            toggledColor = !(toggledColor = true);
                            toggledLight = value ? true : false;
                            toggledDark = !(toggledDark = true);

                          Provider.of<SettingsBloc>(context, listen: false).add(
                              const ThemeChanged(
                                  theme: AppTheme.lightTheme,
                                  ));
                          });
                        }),
                    SwitchListTile(
                        title: Text('Dark',
                            style:
                                appThemeData[state.theme]!.textTheme.bodyText1),
                        value: toggledDark,
                        activeColor: appThemeData[state.theme]!.splashColor,
                        selected: toggledDark,
                        secondary: const Icon(Icons.dark_mode),
                        onChanged: (value) {
                          setState(() {
                            toggledColor = !(toggledColor = true);
                            toggledLight = !(toggledLight = true);
                            toggledDark = value ? true : false;
                          });


                          Provider.of<SettingsBloc>(context, listen: false).add(
                             const  ThemeChanged(
                                  theme: AppTheme.darkTheme,
                                  ));
                        }),
                    const Divider(height: 5, thickness: 2.0),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Slider(
                          value: initialFontSize,
                          min: 10.0,
                          max: 40.00,
                          divisions: 15,
                          label: '${initialFontSize.round()}',
                          onChanged: (double value) {
                            setState(() {
                              initialFontSize = value.roundToDouble();

                              Provider.of<SettingsBloc>(context, listen: false)
                                  .add(FontSizeChanged(fontSize: value));
                            });
                          }),
                      Text('Choose font size',
                          style: appThemeData[state.theme]!
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: initialFontSize)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
