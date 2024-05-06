import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

import '../list_item/list_poster_item.dart';

class SeriseListView extends StatelessWidget {
  const SeriseListView({
    super.key,
    required this.serises,
  });

  final List<SeriesModel> serises;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MSConstances.listMargin,
      child: SizedBox(
        height: MSConstances.listHeight,
        child: Builder(builder: (context) {
          if (serises.isEmpty) {
            return Center(
              child: Text(
                "Nothing to Show",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: serises.length,
            itemBuilder: (context, index) => ListPosterItem(
              imageUrl: serises[index].posterPath != null
                  ? EndPoints.getImageUrl(serises[index].posterPath!)
                  : EndPoints.noPosterUrl,
              mediaType: "tv",
              id: serises[index].id ?? -1,
              ratting: (serises[index].votePercentage ?? 0) / 10.0,
            ),
          );
        }),
      ),
    );
  }
}
