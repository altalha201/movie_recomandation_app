import 'package:flutter/material.dart';

import '../../utils/exports.dart';

class NavbarController extends ChangeNotifier{
  int _currentTabIndex = 0;
  Widget _currentTab = const HomeTab();

  final List<Widget> _tabItems = [
    const HomeTab(),
    const ShowTab(),
    const SearchTab(),
    const Center(child: Text("Acount Section", style: TextStyle(color: Colors.white),)),
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