import 'package:flutter/material.dart';

import 'exports.dart';

class MSTheme {
  const MSTheme();

  static ThemeData provide(BuildContext context) => ThemeData(
        useMaterial3: true,
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: MSColors.scafoldBackground,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(
                MediaQuery.of(context).size.width,
                60,
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              textStyle: const TextStyle(
                fontSize: 18,
                fontFamily: 'open sans',
                fontWeight: FontWeight.w600,
              )),
        ),
      );
}
