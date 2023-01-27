// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../config/theme.dart';
import '../../logic/bloc/theme_bloc/theme_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final double _value = 20;
  bool _toggledColor = true;
  bool _toggledLight = false;
  bool _toggledDark = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('settings'),
            titleTextStyle: textTheme().headline1,
            iconTheme: state.themeData.iconTheme,
          ),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Сhoose an app theme:',
                        style: state.themeData.textTheme.bodyText2),
                    SwitchListTile(
                        title: Text('Colored',
                            style: state.themeData.textTheme.bodyText1),
                        value: _toggledColor,
                        activeColor: state.themeData.splashColor,
                        onChanged: (value) {
                          Provider.of<ThemeBloc>(context, listen: false).add(
                              const ThemeChanged(theme: AppTheme.colorTheme));

                          setState(() {
                            _toggledColor = value ? true : false;
                            _toggledDark = !(_toggledDark = true);
                            _toggledLight = !(_toggledLight = true);
                          });
                        }),
                    SwitchListTile(
                        title: Text('Light',
                            style: state.themeData.textTheme.bodyText1),
                        value: _toggledLight,
                        activeColor: state.themeData.splashColor,
                        onChanged: (value) {
                          Provider.of<ThemeBloc>(context, listen: false).add(
                              const ThemeChanged(theme: AppTheme.lightTheme));

                          setState(() {
                            _toggledColor = !(_toggledColor = true);
                            _toggledLight = value ? true : false;
                            _toggledDark = !(_toggledDark = true);
                          });
                        }),
                    SwitchListTile(
                        title: Text('Dark',
                            style: state.themeData.textTheme.bodyText1),
                        value: _toggledDark,
                        activeColor: state.themeData.splashColor,
                        onChanged: (value) {
                          Provider.of<ThemeBloc>(context, listen: false).add(
                              const ThemeChanged(theme: AppTheme.darkTheme));

                          setState(() {
                            _toggledColor = !(_toggledColor = true);
                            _toggledLight = !(_toggledLight = true);
                            _toggledDark = value ? true : false;
                          });
                        }),
                    const Divider(height: 5, thickness: 2.0),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Slider(
                          value: _value,
                          min: 10.0,
                          max: 40.00,
                          divisions: 15,
                          label: '${_value.round()}',
                          onChanged: (value) {
                            setState(() {
                              value = _value;
                            });
                          }),
                      Text('Choose font size',
                          style: state.themeData.textTheme.bodyText2),
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
