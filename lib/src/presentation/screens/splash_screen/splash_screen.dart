import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';

import '../../../utils/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      await Future.wait(Providers.onLoadUp(context)).then(
        (value) {
          Navigate.pushAndRemoveUntil(
            context,
            const BottomNavbarScreen(),
          );
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppProgressIndicator(),
    );
  }
}
