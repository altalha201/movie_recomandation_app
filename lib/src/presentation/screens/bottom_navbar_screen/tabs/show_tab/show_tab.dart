import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/exports.dart';

class ShowTab extends StatefulWidget {
  const ShowTab({super.key});

  @override
  State<ShowTab> createState() => _ShowTabState();
}

class _ShowTabState extends State<ShowTab> {
  bool _loading = false;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      final movies = Provider.of<MovieRoomController>(context, listen: false);
      final serieses = Provider.of<SeriseRoomController>(context, listen: false);
      if (movies.emptyShow() && serieses.emptyShow()) {
        await _fetch();
      }
    });
    super.initState();
  }

  Future<void> _fetch() async {
    setState(() {
      _loading = true;
    });
    await Future.wait(Providers.onShow(context)).then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const AppProgressIndicator();
    } else {
      return RefreshIndicator(
        onRefresh: _fetch,
        child: Consumer2<MovieRoomController, SeriseRoomController>(
          builder: (context, movies, serieses, _) {
            if (movies.emptyShow() && serieses.emptyShow()) {
              return const _NothingToShow();
            } else {
              return const _TabBody();
            }
          },
        ),
      );
    }
  }
}

class _NothingToShow extends StatelessWidget {
  const _NothingToShow();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Nothing to show",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class _TabBody extends StatelessWidget {
  const _TabBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        children: const [
          _UpcomingMovies(),
          _OnAirSeries(),
          _PopularMovies(),
          _PopularTvSeries(),
          _TopRatedMovies(),
          _TopRatedSeries(),
        ],
      ),
    );
  }
}

class _PopularMovies extends StatelessWidget {
  const _PopularMovies();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRoomController>(
      builder: (context, provider, _) {
        return MovieListView(
          movies: provider.popular,
          title: 'Popular Movies',
        );
      },
    );
  }
}

class _UpcomingMovies extends StatelessWidget {
  const _UpcomingMovies();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRoomController>(
      builder: (context, provider, _) {
        return MovieListView(
          movies: provider.upcoming,
          title: 'Upcoming Movies',
        );
      },
    );
  }
}

class _TopRatedMovies extends StatelessWidget {
  const _TopRatedMovies();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRoomController>(
      builder: (context, provider, _) {
        return MovieListView(
          movies: provider.topRated,
          title: 'Top Rated Movies',
        );
      },
    );
  }
}

class _OnAirSeries extends StatelessWidget {
  const _OnAirSeries();

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriseRoomController>(
      builder: (context, provider, _) {
        return SeriseListView(
          serises: provider.onAirSerise,
          title: 'On Air Series',
        );
      },
    );
  }
}

class _PopularTvSeries extends StatelessWidget {
  const _PopularTvSeries();

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriseRoomController>(
      builder: (context, provider, _) {
        return SeriseListView(
          serises: provider.popular,
          title: 'Popular Series',
        );
      },
    );
  }
}

class _TopRatedSeries extends StatelessWidget {
  const _TopRatedSeries();

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriseRoomController>(
      builder: (context, provider, _) {
        return SeriseListView(
          serises: provider.topSerise,
          title: 'Top Rated Series',
        );
      },
    );
  }
}
