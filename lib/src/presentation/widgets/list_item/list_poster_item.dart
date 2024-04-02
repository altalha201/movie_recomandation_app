import 'package:flutter/material.dart';

import '../../../utils/navigation_helper.dart';
import '../../screens/details_screen/content_cheacker.dart';
import '../cards/ratting_widget.dart';
import 'list_image_widget.dart';

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
    NavigationHelper.push(
      context,
      ContentChecker(
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
