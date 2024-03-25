import 'package:flutter/material.dart';

import 'app_colors.dart';

class ApplicationTheme {
  static ThemeData provide = ThemeData(
    useMaterial3: true,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.white
      )
    ),
    scaffoldBackgroundColor: AppColors.scafoldBackground,
  );
}
