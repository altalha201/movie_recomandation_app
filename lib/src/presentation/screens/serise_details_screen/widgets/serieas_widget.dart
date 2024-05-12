import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';

import '../../../../utils/exports.dart';

class SeasionWidget extends StatelessWidget {
  const SeasionWidget({
    super.key,
    required this.season,
  });

  final SeasonModel? season;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          ListImageWidget(
            season?.posterPath != null
                ? EndPoints.getImageUrl(season!.posterPath!)
                : EndPoints.noPosterUrl,
            border: true,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  season?.name ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                RichText(
                  text: TextSpan(
                      text: "${season?.episodeCount ?? 0} Episods",
                      children: [
                        if (season?.airDate != null)
                          TextSpan(
                            text: "  |  ${season?.airDate}",
                          ),
                      ]),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                RattingWidget((season?.votePercentage ?? 0) / 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
