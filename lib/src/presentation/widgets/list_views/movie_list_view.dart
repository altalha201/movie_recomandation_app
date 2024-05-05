import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

import '../list_item/list_poster_item.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    super.key,
    required this.movies,
  });

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MSConstances.listMargin,
      child: SizedBox(
        height: MSConstances.listHeight,
        child: Builder(builder: (context) {
          if (movies.isEmpty) {
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
            itemCount: movies.length,
            itemBuilder: (context, index) => ListPosterItem(
              imageUrl: movies[index].posterPath != null
                  ? EndPoints.getImageUrl(movies[index].posterPath!)
                  : EndPoints.noPosterUrl,
              mediaType: "movie",
              id: movies[index].id ?? -1,
              ratting: (movies[index].votePercentage ?? 0) / 10.0,
            ),
          );
        }),
      ),
    );
  }
}
