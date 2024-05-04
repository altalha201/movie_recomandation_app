import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../movie_details_screen/movie_details_screen.dart';
import '../person_details_screen/person_details_screen.dart';
import '../serise_details_screen/serise_details_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.contentType,
    required this.contentId,
  });

  final String contentType;
  final int contentId;

  Widget _viewReturner() {
    switch (contentType) {
      case "tv":
        return SeriseDetailsScreen(id: contentId);
      case "movie":
        return MovieDetailsScreen(id: contentId);
      case "person":
        return PersonDetailsScreen(id: contentId);
      default:
        return const _ErrorScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (contentId == -1) {
      return const _ErrorScreen();
    }
    return _viewReturner();
  }
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.circleXmark,
                    size: 36,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Bad Request 400\nItem not found",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
