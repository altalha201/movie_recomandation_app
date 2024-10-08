import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:provider/provider.dart';

import 'src/utils/exports.dart';

void main() async {
  await GetStorage.init("movie_show_loval_storage");
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
        theme: MSTheme.provide(context),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
