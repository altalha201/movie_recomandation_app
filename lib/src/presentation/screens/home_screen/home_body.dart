import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/movie_room_controller.dart';
import '../../../controllers/person_room_controller.dart';
import '../../../controllers/serise_room_controller.dart';
import '../../../utils/navigation_helper.dart';
import '../../widgets/title_widget.dart';
import '../explore_screen/explore_screen.dart';
import 'lists/movie_list_view.dart';
import 'lists/person_list_view.dart';
import 'lists/serise_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  void _onExplore(BuildContext context) {
    NavigationHelper.push(context, const ExploreScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(widgets(context)),
    );
  }

  List<Widget> widgets(BuildContext context) {
    return [
      const SizedBox(height: 4.0),
      const TitleWidget("Populer Movies"),
      Consumer<MovieRoomController>(builder: (context, controller, _) {
        return MovieListView(
          movies: controller.popular,
        );
      }),
      const TitleWidget("On Air Serises"),
      Consumer<SeriseRoomController>(builder: (context, controller, _) {
        return SeriseListView(serises: controller.onAirSerise);
      }),
      const TitleWidget("Top Rated Movies"),
      Consumer<MovieRoomController>(builder: (context, controller, _) {
        return MovieListView(movies: controller.topRated);
      }),
      const TitleWidget("Top Rated Serises"),
      Consumer<SeriseRoomController>(builder: (context, controller, _) {
        return SeriseListView(serises: controller.topSerise);
      }),
      const TitleWidget("Populer Personalities"),
      Consumer<PersonRoomController>(builder: (context, controller, _) {
        return PersonListView(persons: controller.populer);
      }),
      const SizedBox(height: 8),
      ElevatedButton(
        onPressed: () => _onExplore(context),
        child: const Text("Explore More"),
      ),
      const SizedBox(height: 32.0),
    ];
  }
}
