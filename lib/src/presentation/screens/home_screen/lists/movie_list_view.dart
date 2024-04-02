import 'package:flutter/material.dart';

import '../../../../models/movie_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/urls.dart';
import '../../../widgets/list_item/list_poster_item.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    super.key,
    required this.movies,
    this.onSeeMore,
  });

  final List<MovieModel> movies;
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
          itemCount: movies.length,
          itemBuilder: (context, index) => ListPosterItem(
            imageUrl: movies[index].posterPath != null
                ? Urls.getImageUrl(movies[index].posterPath!)
                : Urls.noPosterUrl,
            mediaType: "movie",
            id: movies[index].id ?? -1,
            ratting: movies[index].voteAverage ?? 0,
          ),
        ),
      ),
    );
  }
}
