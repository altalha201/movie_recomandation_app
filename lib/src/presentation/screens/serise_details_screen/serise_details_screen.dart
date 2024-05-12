import 'package:flutter/material.dart';
import 'package:navigate/navigate.dart';
import 'package:provider/provider.dart';

import '../../../utils/exports.dart';

class SeriseDetailsScreen extends StatefulWidget {
  final int id;
  const SeriseDetailsScreen({super.key, required this.id});

  @override
  State<SeriseDetailsScreen> createState() => _SeriseDetailsScreenState();
}

class _SeriseDetailsScreenState extends State<SeriseDetailsScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) async {
        await context.read<SeriseRoomController>().getInfo(widget.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriseRoomController>(
      builder: (context, provider, _) {
        if (provider.loadingScreen) {
          return const AppProgressIndicator();
        } else {
          if (provider.currentPage.isNull ?? false) {
            return const ErrorScreen();
          }
          return const _SeriesView();
        }
      },
    );
  }
}

class _SeriesView extends StatelessWidget {
  const _SeriesView();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: const [
              _TrailerSection(),
              _PosterSection(),
              _Tags(),
              _OverviewSection(),
              TableSection(),
              _ImageSection(),
              _SeasonSection(),
              _SimilerSection(),
              _RecommendationSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrailerSection extends StatelessWidget {
  const _TrailerSection();

  @override
  Widget build(BuildContext context) {
    var videos = context.read<SeriseRoomController>().currentPage.videos;
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

class _PosterSection extends StatelessWidget {
  const _PosterSection();

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriseRoomController>(
      builder: (context, provider, _) => PosterandTitle(
        onFavourit: () {},
        mediaName: provider.currentPage.name,
        tagline: provider.currentPage.tagline,
        mainPoster: provider.currentPage.mainPosterPath,
        votePercentage: provider.currentPage.votePercentage,
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags();

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriseRoomController>(
      builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Wrap(
            runSpacing: 8.0,
            spacing: 8.0,
            children: [
              ...CoreFunctions.getGeners(provider.currentPage.genres)
                  .map((e) => TagWidget(text: e)),
              TagWidget(text: "${provider.currentPage.status}"),
              if ((provider.currentPage.numberOfSeasons ?? 0) > 1)
                TagWidget(
                  text: "${provider.currentPage.numberOfSeasons} Seasons",
                ),
            ],
          ),
        );
      },
    );
  }
}

class _OverviewSection extends StatelessWidget {
  const _OverviewSection();

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriseRoomController>(
      builder: (context, provider, _) {
        if (provider.currentPage.overview == "") {
          return const SizedBox.shrink();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TitleWidget("Series Overview"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                provider.currentPage.overview ?? "",
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

class _ImageSection extends StatelessWidget {
  const _ImageSection();

  @override
  Widget build(BuildContext context) {
    var current = context.read<SeriseRoomController>().currentPage;
    if (current.images?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
        onPressed: () {
          Navigate.push(
            context,
            ImagesViewScreen(
              title: current.name ?? "",
              images: current.images ?? [],
            ),
          );
        },
        child: const Text("See Images"),
      ),
    );
  }
}

class _SeasonSection extends StatelessWidget {
  const _SeasonSection();

  @override
  Widget build(BuildContext context) {
    var seasons = context.read<SeriseRoomController>().currentPage.seasons;
    if (seasons?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget("Seasons"),
          ListView.builder(
            itemCount: seasons?.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var season = seasons?[index];
              return SeasionWidget(season: season);
            },
          ),
        ],
      ),
    );
  }
}

class _SimilerSection extends StatelessWidget {
  const _SimilerSection();

  @override
  Widget build(BuildContext context) {
    final list = context.read<SeriseRoomController>().currentPage.similar;
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
        context.read<SeriseRoomController>().currentPage.recommendations;
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
