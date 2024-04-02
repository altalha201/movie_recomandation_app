import 'package:flutter/material.dart';

import '../../../models/movie_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/navigation_helper.dart';
import '../../../utils/urls.dart';
import '../../screens/details_screen/content_cheacker.dart';
import '../cards/ratting_widget.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    super.key,
    required this.item,
    this.grid = false,
  });

  final MovieModel item;
  final bool grid;

  void _ontap(BuildContext context) {
    NavigationHelper.push(
      context,
      ContentChecker(
        contentType: "movie",
        contentId: item.id ?? -1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _ontap(context),
      child: Container(
        height: Constances.listItemHeight,
        width: Constances.listItemWeight,
        margin: grid ? EdgeInsets.zero : Constances.listItemMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(grid ? 0 : 8),
          image: DecorationImage(
            image: NetworkImage(
              item.posterPath != null
                  ? Urls.getImageUrl(item.posterPath!)
                  : Urls.noPosterUrl,
            ),
            fit: BoxFit.fill
          ),
        ),
        alignment: Alignment.bottomRight,
        child: RattingWidget(item.voteAverage ?? 0),
      ),
    );
  }
}
