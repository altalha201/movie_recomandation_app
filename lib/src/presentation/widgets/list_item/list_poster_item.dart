import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';

import '../../../utils/exports.dart';

class ListPosterItem extends StatelessWidget {
  const ListPosterItem({
    super.key,
    required this.imageUrl,
    required this.mediaType,
    required this.id,
    required this.ratting,
  });

  final String imageUrl;
  final String mediaType;
  final int id;
  final double ratting;

  void _onTap(BuildContext context) {
    Navigate.push(
      context,
      DetailsScreen(
        contentType: mediaType,
        contentId: id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListImageWidget(
      imageUrl,
      onPressed: () => _onTap(context),
      childAlignment: Alignment.bottomRight,
      child: RattingWidget(ratting),
    );
  }
}
