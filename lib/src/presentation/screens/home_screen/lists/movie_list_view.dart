import 'package:flutter/material.dart';

import '../../../../models/movie_model.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/button/see_more_button.dart';
import '../../../widgets/list_item/movie_list_item.dart';

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
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            if (index < movies.length) {
              return MovieListItem(
                item: movies.elementAt(index),
              );
            }
            return SeeMoreButton(
              onTap: onSeeMore,
            );
          },
        ),
      ),
    );
  }
}
