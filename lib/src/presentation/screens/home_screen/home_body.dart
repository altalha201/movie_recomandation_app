import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/serise_room_controller.dart';
import '../../widgets/title_widget.dart';
import 'lists/serise_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(widgets),
    );
  }

  List<Widget> get widgets {
    return [
      const SizedBox(height: 4.0),
      const TitleWidget("On Air Serises"),
      Consumer<SeriseRoomController>(builder: (context, controller, _) {
        return SeriseListView(serises: controller.onAirSerise);
      }),
      const TitleWidget("Top Rated Serises"),
      Consumer<SeriseRoomController>(builder: (context, controller, _) {
        return SeriseListView(serises: controller.topSerise);
      }),
      const SizedBox(height: 8.0),
    ];
  }
}
