import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'movie_details_screen.dart';
import 'people_details_screen.dart';
import 'serise_details_screen.dart';

class ContentChecker extends StatefulWidget {
  const ContentChecker({
    super.key,
    required this.contentType,
    required this.contentId,
  });

  final String contentType;
  final int contentId;

  @override
  State<ContentChecker> createState() => _ContentCheckerState();
}

class _ContentCheckerState extends State<ContentChecker> {
  Widget viewReturner() {
    switch (widget.contentType) {
      case "tv":
        return SeriseDetailsScreen(id: widget.contentId);
      case "movie":
        return MovieDetailsScreen(id: widget.contentId);
      case "people":
        return PeopleDetailsScreen(id: widget.contentId);
      default:
        return errorScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return viewReturner();
  }

  Widget errorScreen() {
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
                    "Bad Request 400",
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
