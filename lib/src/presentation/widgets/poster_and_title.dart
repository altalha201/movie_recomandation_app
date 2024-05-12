import 'package:flutter/material.dart';
import 'package:movie_show_api/movie_show_api.dart';

import '../../utils/exports.dart';

class PosterandTitle extends StatelessWidget {
  const PosterandTitle({
    super.key,
    this.mainPoster,
    this.mediaName,
    this.tagline,
    this.votePercentage,
    required this.onFavourit,
  });

  final String? mainPoster;
  final String? mediaName;
  final String? tagline;
  final int? votePercentage;
  final VoidCallback onFavourit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListImageWidget(
            mainPoster != null
                ? EndPoints.getImageUrl(mainPoster!)
                : EndPoints.noPosterUrl,
            border: true,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  mediaName ?? "",
                  style:
                      Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                ),
                Text(
                  tagline ?? "",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PercentageWidget(
                        percentage: votePercentage ?? 0,
                        backgroundColor: Colors.transparent,
                      ),
                      Expanded(
                        child: FavouriteButton(
                          onPressed: onFavourit,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
