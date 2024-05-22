import 'package:flutter/material.dart';

import 'exports.dart';

class MSTheme {
  const MSTheme();

  static ThemeData provide(BuildContext context) => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: _inputBorder(),
          focusColor: Colors.amber,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: _inputBorder(color: Colors.amber.shade400),
          focusedBorder: _inputBorder(color: Colors.amber.shade800),
          errorBorder: _inputBorder(color: Colors.red),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 22,
          ),
        ),
        scaffoldBackgroundColor: MSColors.scafoldBackground,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(
              MediaQuery.of(context).size.width,
              60,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 18,
              fontFamily: 'open sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

  static OutlineInputBorder _inputBorder({Color color = Colors.amber}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
