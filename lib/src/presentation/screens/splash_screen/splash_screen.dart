import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';

import '../../../utils/providers.dart';
import '../../widgets/app_progress_indicator.dart';
import '../bottom_navbar_screen/bottom_navbar_screen.dart';

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
