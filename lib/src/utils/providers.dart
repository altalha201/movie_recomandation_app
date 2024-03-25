import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../controllers/date_frame_selactor_controller.dart';
import '../controllers/search_function_controller.dart';
import '../controllers/tranding_controllers.dart';

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
      ];
}