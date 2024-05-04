import 'package:flutter/material.dart';

import '../../../models/serise_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/urls.dart';
import '../list_item/list_poster_item.dart';

class SeriseListView extends StatelessWidget {
  const SeriseListView({
    super.key,
    required this.serises,
    this.onSeeMore,
  });

  final List<SeriseModel> serises;
  final VoidCallback? onSeeMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constances.listMargin,
      child: SizedBox(
        height: Constances.listHeight,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: serises.length,
          itemBuilder: (context, index) => ListPosterItem(
            imageUrl: serises[index].posterPath != null
                ? Urls.getImageUrl(serises[index].posterPath!)
                : Urls.noPosterUrl,
            mediaType: "tv",
            id: serises[index].id ?? -1,
            ratting: serises[index].voteAverage ?? 0,
          ),
        ),
      ),
    );
  }
}