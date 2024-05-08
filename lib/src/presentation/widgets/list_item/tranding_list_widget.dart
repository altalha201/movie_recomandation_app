import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:navigate/navigate.dart';

import '../../screens/details_screen/details_screen.dart';
import '../cards/percentage_widget.dart';

class TrandingListWidget extends StatelessWidget {
  final TrandingModel data;
  final int index;
  const TrandingListWidget({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.push(
          context,
          DetailsScreen(
            contentType: data.mediaType ?? "",
            contentId: data.id ?? -1,
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                (data.posterPath != null)
                    ? EndPoints.getImageUrl(data.posterPath!)
                    : EndPoints.noPosterUrl,
              ),
              fit: BoxFit.fill,
            ),
          ),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "# $index",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              PercentageWidget(
                percentage: data.votePercentage ?? 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
