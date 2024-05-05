import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';

class MovieRoomController extends ChangeNotifier {
  bool _loadingScreen = false;

  final List<MovieModel> _popularList = [],
      _topRatedList = [],
      _upcomingList = [],
      _nowPlaying = [];

  bool get loading => _loadingScreen;

  List<MovieModel> get popular => _popularList;
  List<MovieModel> get topRated => _topRatedList;
  List<MovieModel> get nowPlaying => _nowPlaying;
  List<MovieModel> get upcoming => _upcomingList;

  Future<void> getNowPlaying() async {
    final response = await ApiServices.getRequest(
      EndPoints.movieUrls("now_playing"),
      params: {
        "region": "bd",
      },
    );

    if (response.success) {
      _topRatedList.clear();
      List ls = response.body?["results"] ?? [];
      for (var element in ls) {
        _nowPlaying.add(MovieModel.fromJson(element));
      }
    }

    notifyListeners();
  }

  Future<void> getUpcoming() async {
    final response = await ApiServices.getRequest(
      EndPoints.movieUrls("upcoming"),
      params: {
        "region": "bd",
      },
    );

    if (response.success) {
      _upcomingList.clear();
      List ls = response.body?["results"] ?? [];
      for (var element in ls) {
        _upcomingList.add(MovieModel.fromJson(element));
      }
    }

    notifyListeners();
  }

  Future<void> getPopular() async {
    final response =
        await ApiServices.getRequest(EndPoints.movieUrls("popular"));

    if (response.success) {
      _popularList.clear();
      List ls = response.body?["results"] ?? [];
      for (var element in ls) {
        _popularList.add(MovieModel.fromJson(element));
      }
    }

    notifyListeners();
  }

  Future<void> getTopRated() async {
    final response =
        await ApiServices.getRequest(EndPoints.movieUrls("top_rated"));

    if (response.success) {
      _topRatedList.clear();
      List ls = response.body?["results"] ?? [];
      for (var element in ls) {
        _topRatedList.add(MovieModel.fromJson(element));
      }
    }

    notifyListeners();
  }

  Future<void> getInfo(int id) async {
    _loadingScreen = true;
    notifyListeners();
  }
}
