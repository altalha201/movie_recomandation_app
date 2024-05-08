import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../repository/serise_repository.dart';

class SeriseRoomController extends ChangeNotifier {
  bool _loadingScreen = false;

  SeriesDetailsModel _currentPage = SeriesDetailsModel(isNull: true);

  List<SeriesModel> _onAir = [],
      _topRated = [],
      _airingToday = [],
      _populer = [];

  bool get loadingScreen => _loadingScreen;
  SeriesDetailsModel get currentPage => _currentPage;

  List<SeriesModel> get onAirSerise => _onAir;
  List<SeriesModel> get topSerise => _topRated;
  List<SeriesModel> get airingToday => _airingToday;
  List<SeriesModel> get popular => _populer;

  Future<void> getAiringToday() async {
    _airingToday = await SeriesRepository.getListOfSeries(
      SeriesCetagories.airingToday,
    );

    notifyListeners();
  }

  Future<void> getOnTheAir() async {
    _onAir = await SeriesRepository.getListOfSeries(
      SeriesCetagories.onTheAir,
    );

    notifyListeners();
  }

  Future<void> getPopular() async {
    _populer = await SeriesRepository.getListOfSeries(
      SeriesCetagories.popular,
    );
    notifyListeners();
  }

  Future<void> getTopRated() async {
    _topRated = await SeriesRepository.getListOfSeries(
      SeriesCetagories.topRated,
    );

    notifyListeners();
  }

  Future<void> getInfo(int id) async {
    _loadingScreen = true;
    notifyListeners();
    _currentPage = await SeriesRepository.getSeriesByID(id);
    _loadingScreen = false;
    notifyListeners();
  }

  bool emptyShow() {
    if (_populer.isEmpty &&
        _topRated.isEmpty &&
        _onAir.isEmpty) {
      return true;
    }
    return false;
  }
}
