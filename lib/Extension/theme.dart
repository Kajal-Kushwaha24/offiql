import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/theme.dart';
import '../Utils/colors.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  bool get isDarkMode => theme.brightness == Brightness.dark;

  void toggleTheme() {
    read<ThemeProvider>().toggleTheme(!isDarkMode);
  }

  get backgroundColor =>
      isDarkMode ? backGroundColorDark : backGroundColorLight;

  get cardBg => isDarkMode ? cardDark : backGroundColorLight;


  get textColor => isDarkMode ? Colors.white : Colors.black;

}
