import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../repository/movie_repository.dart';

class MovieRoomController extends ChangeNotifier {
  bool _loadingScreen = false;

  List<MovieModel> _popularList = [],
      _topRatedList = [],
      _upcomingList = [],
      _nowPlaying = [];

  MovieDetailsModel _currentMovie = MovieDetailsModel(isNull: true);

  bool get loading => _loadingScreen;
  MovieDetailsModel get currentMovie => _currentMovie;

  List<MovieModel> get popular => _popularList;
  List<MovieModel> get topRated => _topRatedList;
  List<MovieModel> get nowPlaying => _nowPlaying;
  List<MovieModel> get upcoming => _upcomingList;

  Future<void> getNowPlaying() async {
    _nowPlaying = await MovieRepository.getMovies(MovieCetagories.nowPlaying);
    notifyListeners();
  }

  Future<void> getUpcoming() async {
    _upcomingList = await MovieRepository.getMovies(MovieCetagories.upcoming);

    notifyListeners();
  }

  Future<void> getPopular() async {
    _popularList = await MovieRepository.getMovies(MovieCetagories.popular);

    notifyListeners();
  }

  Future<void> getTopRated() async {
    _topRatedList = await MovieRepository.getMovies(MovieCetagories.topRated);

    notifyListeners();
  }

  Future<void> getInfo(int id) async {
    _loadingScreen = true;
    notifyListeners();
    _currentMovie = await MovieRepository.getMovieByID(id);
    _loadingScreen = false;
    notifyListeners();
  }

  bool emptyShow() {
    if (_popularList.isEmpty &&
        _topRatedList.isEmpty &&
        _upcomingList.isEmpty) {
      return true;
    }
    return false;
  }
}
