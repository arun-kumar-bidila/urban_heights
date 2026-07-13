import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Montserrat",
    scaffoldBackgroundColor: Color(0xFFf8f9fb),
    appBarTheme: AppBarTheme(
      elevation: 5,
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black26,
      foregroundColor: AppColors.stealBlue,
      iconTheme: IconThemeData(color: AppColors.stealBlue),
    ),
  );
}
