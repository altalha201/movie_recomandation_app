import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/exports.dart';

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
          _NowPlayingMovies(),
          _AiringToday(),
          _PopularPersonsList(),
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
        return PersonListView(
          persons: personRoom.populer,
          title: 'Popular Persons',
        );
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
        return MovieListView(
          movies: controller.nowPlaying,
          title: 'In Theaters (BD)',
        );
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
        return SeriseListView(
          serises: controller.airingToday,
          title: 'Airing Today',
        );
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
            for (int i = 0; i < trandingController.trandingList.length; i++)
              TrandingListWidget(
                data: trandingController.trandingList.elementAt(i),
                index: i + 1,
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
