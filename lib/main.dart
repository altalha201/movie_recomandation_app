import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/presentation/screens/splash_screen/splash_screen.dart';
import 'src/utils/application_theme.dart';
import 'src/utils/providers.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.all,
      child: MaterialApp(
        title: "Movie Show",
        themeMode: ThemeMode.dark,
        theme: ApplicationTheme.provide(context),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
