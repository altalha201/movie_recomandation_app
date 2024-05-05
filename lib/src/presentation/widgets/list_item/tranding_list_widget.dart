import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:navigate/navigate.dart';

import '../../screens/details_screen/details_screen.dart';
import '../cards/percentage_widget.dart';

class TrandingListWidget extends StatelessWidget {
  final TrandingModel data;
  const TrandingListWidget({
    super.key,
    required this.data,
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
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(16),
          child: PercentageWidget(
            percentage: data.votePercentage ?? 0,
          ),
        ),
      ),
    );
  }
}
