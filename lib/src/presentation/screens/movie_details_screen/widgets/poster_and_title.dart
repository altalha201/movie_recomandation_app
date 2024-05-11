import 'package:flutter/material.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:provider/provider.dart';

import '../../../../utils/exports.dart';

class PosterandTitle extends StatelessWidget {
  const PosterandTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRoomController>(
      builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListImageWidget(
                provider.currentMovie.mainPoster != null
                    ? EndPoints.getImageUrl(provider.currentMovie.mainPoster!)
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
                      provider.currentMovie.title ?? "",
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                    Text(
                      provider.currentMovie.tagline ?? "",
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
                            percentage:
                                provider.currentMovie.votePercentage ?? 0,
                            backgroundColor: Colors.transparent,
                          ),
                          Expanded(
                            child: FavouriteButton(
                              onPressed: () {},
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
      },
    );
  }
}
