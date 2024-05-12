import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'exports.dart';

class Providers {
  static List<SingleChildWidget> all = [
    ChangeNotifierProvider<TrandingController>(
      create: (_) => TrandingController(),
    ),
    ChangeNotifierProvider<DateFrameSelectorController>(
      create: (_) => DateFrameSelectorController(),
    ),
    ChangeNotifierProvider<SearchFunctionController>(
      create: (_) => SearchFunctionController(),
    ),
    ChangeNotifierProvider<SeriseRoomController>(
      create: (_) => SeriseRoomController(),
    ),
    ChangeNotifierProvider<MovieRoomController>(
      create: (_) => MovieRoomController(),
    ),
    ChangeNotifierProvider<PersonRoomController>(
      create: (_) => PersonRoomController(),
    ),
    ChangeNotifierProvider<NavbarController>(
      create: (_) => NavbarController(),
    ),
  ];

  static Iterable<Future> onLoadUp(BuildContext context) => [
        context.read<SeriseRoomController>().getAiringToday(),
        context.read<MovieRoomController>().getNowPlaying(),
        context.read<PersonRoomController>().getPopulerList(),
        context.read<TrandingController>().getTrandings(),
      ];

  static Iterable<Future> onShow(BuildContext context) => [
        context.read<MovieRoomController>().getPopular(),
        context.read<MovieRoomController>().getTopRated(),
        context.read<MovieRoomController>().getUpcoming(),
        context.read<SeriseRoomController>().getOnTheAir(),
        context.read<SeriseRoomController>().getPopular(),
        context.read<SeriseRoomController>().getTopRated(),
      ];
}
