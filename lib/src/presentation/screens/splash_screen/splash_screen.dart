import 'package:flutter/material.dart';
import 'package:movie_recomandation_app/src/controllers/serise_room_controller.dart';
import 'package:provider/provider.dart';

import '../../../controllers/tranding_controllers.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/app_progress_indicator.dart';
import '../home_screen/home_screen.dart';

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
      Future.wait([
        Provider.of<SeriseRoomController>(context, listen: false).getTabInfo(),
        Provider.of<TrandingController>(context, listen: false).getTrandings()
      ]).then(
        (value) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.appbarBackground,
      body: AppProgressIndicator(),
    );
  }
}
