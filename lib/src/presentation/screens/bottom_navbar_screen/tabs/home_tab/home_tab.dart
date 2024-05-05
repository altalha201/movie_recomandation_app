import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/data_controller/movie_room_controller.dart';
import '../../../../../controllers/data_controller/person_room_controller.dart';
import '../../../../../controllers/data_controller/serise_room_controller.dart';
import '../../../../../controllers/data_controller/tranding_controllers.dart';
import '../../../../widgets/app_progress_indicator.dart';
import '../../../../widgets/home_screen_title_widget.dart';
import '../../../../widgets/list_item/tranding_list_widget.dart';
import '../../../../widgets/list_views/movie_list_view.dart';
import '../../../../widgets/list_views/person_list_view.dart';
import '../../../../widgets/list_views/serise_list_view.dart';
import '../../../../widgets/title_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: const [
          HomeScreenTitleWidget(),
          SizedBox(
            height: 8,
          ),
          _TrandingSlider(),
          SizedBox(
            height: 24,
          ),
          TitleWidget("In Theaters (BD)"),
          _NowPlayingMovies(),
          SizedBox(
            height: 16,
          ),
          TitleWidget("Airing Today"),
          _AiringToday(),
          SizedBox(
            height: 16,
          ),
          TitleWidget("Populer Persons"),
          _PopularPersonsList(),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class _PopularPersonsList extends StatelessWidget {
  const _PopularPersonsList();

  @override
  Widget build(BuildContext context) {
    return Consumer<PersonRoomController>(
      builder: (context, personRoom, _) {
        return PersonListView(persons: personRoom.populer);
      },
    );
  }
}

class _NowPlayingMovies extends StatelessWidget {
  const _NowPlayingMovies();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRoomController>(
      builder: (context, controller, _) {
        return MovieListView(movies: controller.nowPlaying);
      },
    );
  }
}

class _AiringToday extends StatelessWidget {
  const _AiringToday();

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriseRoomController>(
      builder: (context, controller, _) {
        return SeriseListView(serises: controller.airingToday);
      },
    );
  }
}

class _TrandingSlider extends StatelessWidget {
  const _TrandingSlider();

  @override
  Widget build(BuildContext context) {
    return Consumer<TrandingController>(
      builder: (context, trandingController, _) {
        if (trandingController.isLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: const AppProgressIndicator(),
          );
        }
        return CarouselSlider(
          items: [
            ...trandingController.trandingList.map(
              (trandingItem) => TrandingListWidget(
                data: trandingItem,
              ),
            ),
          ],
          options: CarouselOptions(
            viewportFraction: 0.6,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            height: MediaQuery.of(context).size.height * 0.5,
            enlargeCenterPage: true,
          ),
        );
      },
    );
  }
}
