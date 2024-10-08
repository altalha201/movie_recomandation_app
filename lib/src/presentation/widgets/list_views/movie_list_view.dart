import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

import '../../../utils/exports.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    super.key,
    required this.movies,
    required this.title,
  });

  final String title;
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
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
              itemCount: movies.length,
              itemBuilder: (context, index) => ListPosterItem(
                imageUrl: movies[index].posterPath != null
                    ? EndPoints.getImageUrl(movies[index].posterPath!)
                    : EndPoints.noPosterUrl,
                mediaType: "movie",
                id: movies[index].id ?? -1,
                ratting: (movies[index].votePercentage ?? 0) / 10.0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
