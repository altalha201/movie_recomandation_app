import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

import '../../../utils/exports.dart';

class MediaListView extends StatelessWidget {
  final List<MediaModel> medias;
  final String title;
  const MediaListView({super.key, required this.medias, required this.title});

  @override
  Widget build(BuildContext context) {
    if (medias.isEmpty) {
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
              itemCount: medias.length,
              itemBuilder: (context, index) => ListPosterItem(
                imageUrl: medias[index].posterPath != null
                    ? EndPoints.getImageUrl(medias[index].posterPath!)
                    : EndPoints.noPosterUrl,
                mediaType: medias[index].mediaType ?? "",
                id: medias[index].id ?? -1,
                ratting: (medias[index].votePercentage ?? 0) / 10.0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
