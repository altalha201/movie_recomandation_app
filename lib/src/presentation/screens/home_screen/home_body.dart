import 'package:flutter/material.dart';

import 'tabs/movie_tab.dart';
import 'tabs/person_tab.dart';
import 'tabs/serise_tab.dart';
import 'tabs/upcoming_tab.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  late final TabController _tabController;

  final TextStyle tabTextStyle = TextStyle(
    fontFamily: 'open sans',
    decoration: TextDecoration.none,
    color: Colors.white.withOpacity(1),
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        tabBar(),
        TabBarView(
          controller: _tabController,
          children: const [
            SeriseTab(),
            MovieTab(),
            UpcomingTab(),
            PersonTab(),
          ],
        ),
      ]),
    );
  }

  Widget tabBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 45,
        width: MediaQuery.of(context).size.width,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          physics: const BouncingScrollPhysics(),
          labelPadding: const EdgeInsets.symmetric(horizontal: 12),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.orange,
          ),
          dividerHeight: 0,
          padding: EdgeInsets.zero,
          tabs: [
            tabs("Serise"),
            tabs("Movie"),
            tabs("Upcoming"),
            tabs("Person"),
          ],
        ),
      ),
    );
  }

  Tab tabs(String text) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 2.0,
        ),
        child: Text(
          text,
          style: tabTextStyle,
        ),
      ),
    );
  }
}
