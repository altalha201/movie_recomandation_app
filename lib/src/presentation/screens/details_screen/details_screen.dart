import 'package:flutter/material.dart';

import '../../../utils/exports.dart';

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
        return const ErrorScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (contentId == -1) {
      return const ErrorScreen();
    }
    return _viewReturner();
  }
}