import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_style_util.dart';

class AppTheme {
  static ThemeData cbtTheme = ThemeData(
    fontFamily: "Inter",
    primaryColor: AppColors.brandBlue,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.brandBlue,
      onPrimary: AppColors.white,
      onSecondary: AppColors.brandBlue,
      secondary: AppColors.white,
      error: AppColors.errorColor,
      onError: AppColors.white,
      background: AppColors.white,
      onBackground: AppColors.brandBlue,
      surface: AppColors.white,
      onSurface: AppColors.brandBlue,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.brandBlue),
      titleTextStyle: semiBoldStyle(18, AppColors.brandBlue),
    ),
  );
}
