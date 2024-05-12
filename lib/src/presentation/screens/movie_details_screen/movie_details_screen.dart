import 'package:flutter/material.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:navigate/navigate.dart';
import 'package:provider/provider.dart';

import '../../../utils/exports.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int id;
  const MovieDetailsScreen({super.key, required this.id});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<MovieRoomController>(
          context,
          listen: false,
        ).getInfo(widget.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Consumer<MovieRoomController>(
        builder: (context, provider, _) {
          if (provider.loading) {
            return const AppProgressIndicator();
          } else {
            if (provider.currentMovie.isNull ?? false) {
              return const ErrorScreen();
            }
            return const _MovieView();
          }
        },
      ),
    );
  }
}

class _MovieView extends StatelessWidget {
  const _MovieView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            _TrailerSection(),
            _PosterSection(),
            _Tags(),
            _MovieOverview(),
            MovieTableSection(),
            _ImageSection(),
            _SimilerSection(),
            _RecommendationSection(),
          ],
        ),
      ),
    );
  }
}

class _PosterSection extends StatelessWidget {
  const _PosterSection();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRoomController>(
      builder: (context, provider, _) => PosterandTitle(
        onFavourit: () {},
        mediaName: provider.currentMovie.title,
        tagline: provider.currentMovie.tagline,
        mainPoster: provider.currentMovie.mainPoster,
        votePercentage: provider.currentMovie.votePercentage,
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection();

  @override
  Widget build(BuildContext context) {
    var currentMovie = context.read<MovieRoomController>().currentMovie;
    if (currentMovie.images?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          Navigate.push(
            context,
            ImagesViewScreen(
              title: currentMovie.title ?? "",
              images: currentMovie.images ?? [],
            ),
          );
        },
        child: const Text("See Images"),
      ),
    );
  }
}

class _SimilerSection extends StatelessWidget {
  const _SimilerSection();

  @override
  Widget build(BuildContext context) {
    final list = context.read<MovieRoomController>().currentMovie.similar;
    if (list?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MediaListView(
        medias: list ?? [],
        title: "Similer",
      ),
    );
  }
}

class _RecommendationSection extends StatelessWidget {
  const _RecommendationSection();

  @override
  Widget build(BuildContext context) {
    final list =
        context.read<MovieRoomController>().currentMovie.recommendations;
    if (list?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MediaListView(
        medias: list ?? [],
        title: "Recommended",
      ),
    );
  }
}

class _MovieOverview extends StatelessWidget {
  const _MovieOverview();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRoomController>(
      builder: (context, provider, _) {
        if (provider.currentMovie.overview == "") {
          return const SizedBox.shrink();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TitleWidget("Movie Overview"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                provider.currentMovie.overview ?? "",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            )
          ],
        );
      },
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRoomController>(
      builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            runSpacing: 8.0,
            spacing: 8.0,
            children: [
              ...CoreFunctions.getGeners(provider.currentMovie.genres)
                  .map((e) => TagWidget(text: e)),
              TagWidget(
                text: MSFunctions.convertMinutes(
                    provider.currentMovie.runtime ?? 0),
              ),
              TagWidget(text: "${provider.currentMovie.status}"),
            ],
          ),
        );
      },
    );
  }
}

class _TrailerSection extends StatelessWidget {
  const _TrailerSection();

  @override
  Widget build(BuildContext context) {
    var videos = context.read<MovieRoomController>().currentMovie.videos;
    if (videos?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }
    return FittedBox(
      fit: BoxFit.fill,
      child: VideoPlayer(
        videoKey: CoreFunctions.getTraillerKey(videos),
      ),
    );
  }
}
