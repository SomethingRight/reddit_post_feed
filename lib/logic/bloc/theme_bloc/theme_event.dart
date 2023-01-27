part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged({required this.theme});
  final AppTheme theme;

  @override
  List<Object> get props => [theme];
}
