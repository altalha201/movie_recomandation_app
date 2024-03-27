import 'package:flutter/material.dart';

import '../../../models/serise_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/navigation_helper.dart';
import '../../../utils/urls.dart';
import '../../screens/details_screen/content_cheacker.dart';
import '../cards/ratting_widget.dart';

class SeriseListItem extends StatelessWidget {
  const SeriseListItem({super.key, required this.item});

  final SeriseModel item;

  void _onTap(BuildContext context) {
    NavigationHelper.push(
      context,
      ContentChecker(
        contentType: "tv",
        contentId: item.id ?? -1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        height: Constances.listItemHeight,
        width: Constances.listItemWeight,
        margin: Constances.listItemMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(
              item.posterPath != null
                  ? Urls.getImageUrl(item.posterPath!)
                  : Urls.noPosterUrl,
            ),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.bottomRight,
        child: RattingWidget(item.voteAverage ?? 0),
      ),
    );
  }
}
