import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../controllers/date_frame_selactor_controller.dart';
import '../controllers/movie_room_controller.dart';
import '../controllers/person_room_controller.dart';
import '../controllers/search_function_controller.dart';
import '../controllers/serise_room_controller.dart';
import '../controllers/tranding_controllers.dart';
import '../controllers/ui_controller/navbar_controller.dart';

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
        Provider.of<SeriseRoomController>(context, listen: false).getLists(),
        Provider.of<MovieRoomController>(context, listen: false).getLists(),
        Provider.of<PersonRoomController>(context, listen: false).getPopulerList(),
        Provider.of<TrandingController>(context, listen: false).getTrandings(),
      ];
}
