// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../config/settings_storage.dart';
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
        final settings = appThemeData[state.theme];
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.settings),
            centerTitle: true,
            titleTextStyle: settings!.textTheme.headline1,
            iconTheme: settings.iconTheme,
          ),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(AppLocalizations.of(context)!.chooseAnAppTheme,
                        style: settings.textTheme.headline4),
                    SwitchListTile(
                        title: Text(AppLocalizations.of(context)!.colored,
                            style: settings.textTheme.headline4),
                        value: Variables.toggledColor,
                        activeColor: settings.splashColor,
                        secondary: const Icon(Icons.color_lens),
                        selected: Variables.toggledColor,
                        onChanged: (value) {
                          setState(() {
                            Variables.toggledColor = value ? true : false;
                            Variables.toggledDark =
                                !(Variables.toggledDark = true);
                            Variables.toggledLight =
                                !(Variables.toggledLight = true);

                            Provider.of<SettingsBloc>(context, listen: false)
                                .add(const ThemeChanged(
                              theme: AppTheme.colorTheme,
                            ));

                            SettingsStorage.setTheme(ThemeEnam()
                                .themeColorFromEnum(AppTheme.colorTheme));
                          });
                        }),
                    SwitchListTile(
                        title: Text(AppLocalizations.of(context)!.light,
                            style: settings.textTheme.headline4),
                        value: Variables.toggledLight,
                        activeColor: settings.splashColor,
                        secondary: const Icon(Icons.light_mode),
                        selected: Variables.toggledLight,
                        onChanged: (value) {
                          setState(() {
                            Variables.toggledColor =
                                !(Variables.toggledColor = true);
                            Variables.toggledLight = value ? true : false;
                            Variables.toggledDark =
                                !(Variables.toggledDark = true);

                            Provider.of<SettingsBloc>(context, listen: false)
                                .add(const ThemeChanged(
                              theme: AppTheme.lightTheme,
                            ));

                            SettingsStorage.setTheme(ThemeEnam()
                                .themeColorFromEnum(AppTheme.lightTheme));
                          });
                        }),
                    SwitchListTile(
                        title: Text(AppLocalizations.of(context)!.dark,
                            style: settings.textTheme.headline4),
                        value: Variables.toggledDark,
                        activeColor: settings.splashColor,
                        selected: Variables.toggledDark,
                        secondary: const Icon(Icons.dark_mode),
                        onChanged: (value) {
                          setState(() {
                            Variables.toggledColor =
                                !(Variables.toggledColor = true);
                            Variables.toggledLight =
                                !(Variables.toggledLight = true);
                            Variables.toggledDark = value ? true : false;
                          });

                          Provider.of<SettingsBloc>(context, listen: false)
                              .add(const ThemeChanged(
                            theme: AppTheme.darkTheme,
                          ));

                          SettingsStorage.setTheme(ThemeEnam()
                              .themeColorFromEnum(AppTheme.darkTheme));
                        }),
                    const Divider(height: 5, thickness: 2.0),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Slider(
                          value: Variables.initialFontSize,
                          min: 10.0,
                          max: 40.00,
                          divisions: 15,
                          label: '${Variables.initialFontSize.round()}',
                          onChanged: (double value) {
                            setState(() {
                              Variables.initialFontSize = value.roundToDouble();

                              Provider.of<SettingsBloc>(context, listen: false)
                                  .add(FontSizeChanged(fontSize: value));

                              SettingsStorage.setFontSize(value);
                            });
                          }),
                      Text(AppLocalizations.of(context)!.chooseFontSize,
                          style: settings.textTheme.bodyText2!
                              .copyWith(fontSize: Variables.initialFontSize)),
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
