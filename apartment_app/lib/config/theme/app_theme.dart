import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Montserrat",
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.stealBlue,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
  );
}
