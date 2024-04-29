import 'package:flutter/material.dart';
import 'package:movie_recomandation_app/src/controllers/ui_controller/navbar_controller.dart';
import 'package:movie_recomandation_app/src/presentation/widgets/background.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'tabs/home_tab/home_tab.dart';

class BottomNavbarScreen extends StatelessWidget {
  const BottomNavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarController>(
      builder: (context, navbarController, _) {
        return Scaffold(
          body: Background(child: navbarController.currentTab),
          extendBody: true,
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: navbarController.currentTabIndex,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.transparent,
            onTap: navbarController.changeTab,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.movie_filter),
                title: const Text("Shows"),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.search),
                title: const Text("Search"),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: const Text("Profile"),
              ),
            ],
          ),
        );
      }
    );
  }
}