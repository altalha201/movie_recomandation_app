import 'package:flutter/material.dart';

import '../../models/list_item/serise_model.dart';
import '../../services/api_services.dart';
import '../../utils/urls.dart';

class SeriseRoomController extends ChangeNotifier {
  bool _loadingScreen = false;

  final List<SeriseModel> _onAir = [],
      _topRated = [],
      _airingToday = [],
      _populer = [];

  bool get loadingScreen => _loadingScreen;

  List<SeriseModel> get onAirSerise => _onAir;
  List<SeriseModel> get topSerise => _topRated;
  List<SeriseModel> get airingToday => _airingToday;
  List<SeriseModel> get popular => _populer;

  Future<void> getAiringToday() async {
    final response = await ApiServices.getRequest(
      Urls.tvUrl("airing_today"),
    );

    if (response.success) {
      _airingToday.clear();
      List ls = response.body?["results"] ?? [];
      for (var element in ls) {
        _airingToday.add(SeriseModel.fromJson(element));
      }
    }

    notifyListeners();
  }

  Future<void> getOnTheAir() async {
    final response = await ApiServices.getRequest(
      Urls.tvUrl("on_the_air"),
    );

    if (response.success) {
      _onAir.clear();
      List ls = response.body?["results"] ?? [];
      for (var element in ls) {
        _onAir.add(SeriseModel.fromJson(element));
      }
    }

    notifyListeners();
  }

  Future<void> getPopular() async {
    final response = await ApiServices.getRequest(
      Urls.tvUrl("popular"),
    );

    if (response.success) {
      _populer.clear();
      List ls = response.body?["results"] ?? [];
      for (var element in ls) {
        _populer.add(SeriseModel.fromJson(element));
      }
    }

    notifyListeners();
  }

  Future<void> getTopRated() async {
    final response = await ApiServices.getRequest(
      Urls.tvUrl("top_rated"),
    );

    if (response.success) {
      _topRated.clear();
      List ls = response.body?["results"] ?? [];
      for (var element in ls) {
        _topRated.add(SeriseModel.fromJson(element));
      }
    }

    notifyListeners();
  }

  Future<void> getInfo(int id) async {
    _loadingScreen = true;
    notifyListeners();
  }
}
