import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import 'home_app_bar_section.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scafoldBackground,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          HomeAppBarSaction(),
          HomeBody(),
        ],
      ),
    );
  }

  
}

