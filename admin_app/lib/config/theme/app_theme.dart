import 'package:admin_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Montserrat",
    scaffoldBackgroundColor: Appcolors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors.stealBlue,
      iconTheme: IconThemeData(color: Appcolors.white),
    ),
  );
}
