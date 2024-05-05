import 'package:flutter/material.dart';

import '../../../models/list_item/movie_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/urls.dart';
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
      padding: Constances.listMargin,
      child: SizedBox(
        height: Constances.listHeight,
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
                  ? Urls.getImageUrl(movies[index].posterPath!)
                  : Urls.noPosterUrl,
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
