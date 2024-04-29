import 'package:flutter/material.dart';

import '../../presentation/screens/bottom_navbar_screen/tabs/home_tab/home_tab.dart';

class NavbarController extends ChangeNotifier{
  int _currentTabIndex = 0;
  Widget _currentTab = const HomeTab();

  final List<Widget> _tabItems = [
    const HomeTab(),
    const Center(child: Text("1", style: TextStyle(color: Colors.white),)),
    const Center(child: Text("2")),
    const Center(child: Text("3")),
  ];

  int get currentTabIndex => _currentTabIndex;
  Widget get currentTab => _currentTab;

  void changeTab(int index) {
    _currentTabIndex = index;
    _currentTab = _tabItems[_currentTabIndex];
    notifyListeners();
  }

  void backToHome() {
    _currentTabIndex = 0;
    _currentTab = _tabItems[_currentTabIndex];
    notifyListeners();
  }
}