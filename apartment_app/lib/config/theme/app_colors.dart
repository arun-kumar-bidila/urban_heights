import 'package:flutter/material.dart';

class AppColors {
  static const Color stealBlue = Color(0xFF1b2d45);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color red = Colors.red;
  static const Color lightGreen = Colors.lightGreen;
  static const emerald = Color(0xFF22C55E);
  static const Color lightBlue = Color(0xFF00bcff);
  static const Color mediumBlue = Color(0xFF215c82);
  static const Color lightWhite = Color(0xFFa2abb7);

  // Gradients
  static const Gradient mainGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.stealBlue, AppColors.mediumBlue],
  );

  static Decoration box = BoxDecoration(
    borderRadius: BorderRadius.circular(16),

    boxShadow: [
      BoxShadow(color: AppColors.black, blurRadius: 1.5, spreadRadius: -1),
    ],
    color: AppColors.white,
  );
}
