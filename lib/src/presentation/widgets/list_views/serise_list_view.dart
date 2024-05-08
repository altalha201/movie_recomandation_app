import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

import '../../../utils/exports.dart';

class SeriseListView extends StatelessWidget {
  const SeriseListView({
    super.key,
    required this.serises,
    required this.title,
  });
  final String title;
  final List<SeriesModel> serises;

  @override
  Widget build(BuildContext context) {
    if (serises.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(title),
        Padding(
          padding: MSConstances.listMargin,
          child: SizedBox(
            height: MSConstances.listHeight,
            child: ListView.builder(
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
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
