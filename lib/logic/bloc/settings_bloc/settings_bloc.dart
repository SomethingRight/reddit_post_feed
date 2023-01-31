import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/theme.dart';       

part 'settings_event.dart';
part 'settings_state.dart';         

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState(theme: initialTheme, newFontSize: initialFontSize)) {
    on<SettingsEvent>((event, emit) {
      if (event is ThemeChanged) {
        emit.call(SettingsState(theme: event.theme, newFontSize: initialFontSize));
      }
      else if (event is FontSizeChanged){
        emit.call(SettingsState(newFontSize: event.fontSize, theme: super.state.theme));
      }
    });
  }
}
