import 'package:flutter/material.dart';

import '../models/serise_model.dart';
import '../services/api_services.dart';
import '../utils/urls.dart';

class SeriseRoomController extends ChangeNotifier{
  bool _loadingScreen = false;

  final List<SeriseModel> _onAir = [], _topRated = [];

  bool get loadingScreen => _loadingScreen;

  List<SeriseModel> get onAirSerise => _onAir;
  List<SeriseModel> get topSerise => _topRated;

  Future<void> getLists() async {
    final responses = await Future.wait([
      ApiServices.getRequest(Urls.tvUrl("on_the_air")),
      ApiServices.getRequest(Urls.tvUrl("top_rated")),
    ]);

    if(responses[0].success) {
      _onAir.clear();
      List pList = responses[0].body?["results"] ?? [];
      for (var element in pList) {
        _onAir.add(SeriseModel.fromJson(element));
      }
    }
    if(responses[1].success) {
      _topRated.clear();
      List pList = responses[1].body?["results"] ?? [];
      for (var element in pList) {
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