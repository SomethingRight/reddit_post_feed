import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../config/theme.dart';       

part 'settings_event.dart';
part 'settings_state.dart';         

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState(theme: Variables.initialTheme, newFontSize: Variables.initialFontSize)) {
    on<SettingsEvent>((event, emit) {
      if (event is ThemeChanged) {
        emit.call(SettingsState(theme: event.theme, newFontSize: Variables.initialFontSize));
      }
      else if (event is FontSizeChanged){
        emit.call(SettingsState(newFontSize: event.fontSize, theme: super.state.theme));
      }
    });
  }
}
