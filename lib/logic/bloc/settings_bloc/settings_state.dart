// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.theme,required this.newFontSize});

  final AppTheme theme;
  final double newFontSize;

  @override
  List<Object> get props => [newFontSize, theme];
}
