import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import '../services/api_services.dart';
import '../utils/urls.dart';

class MovieRoomController extends ChangeNotifier {
  bool _loadingScreen = false;

  final List<MovieModel> _popularList = [], _topRatedList = [];

  bool get loading => _loadingScreen;

  List<MovieModel> get popular => _popularList;
  List<MovieModel> get topRated => _topRatedList;

  Future<void> getLists() async {
    final responses = await Future.wait([
      ApiServices.getRequest(Urls.moviUrls("popular")),
      ApiServices.getRequest(Urls.moviUrls("top_rated")),
    ]);

    if(responses[0].success) {
      _popularList.clear();
      List ls = responses[0].body?["results"] ?? [];
      for(var element in ls) {
        _popularList.add(MovieModel.fromJson(element));
      }
    }
    if(responses[1].success) {
      _topRatedList.clear();
      List ls = responses[1].body?["results"] ?? [];
      for(var element in ls) {
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