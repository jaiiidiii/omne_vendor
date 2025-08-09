
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(ThemeMode.system));

  void toggleTheme() {
    final newThemeMode = state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(ThemeState(newThemeMode));
  }
}