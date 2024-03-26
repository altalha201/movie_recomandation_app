import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/serise_model.dart';
import '../services/api_services.dart';
import '../utils/urls.dart';

class SeriseRoomController extends ChangeNotifier{
  bool _loadingTab = false, _loadingScreen = false;

  final List<SeriseModel> _populerList = [], _onAir = [], _topRated = [];

  bool get loadingTab => _loadingTab;
  bool get loadingScreen => _loadingScreen;

  List<SeriseModel> get populerSerise => _populerList;
  List<SeriseModel> get onAirSerise => _onAir;
  List<SeriseModel> get topSerise => _topRated;

  Future<void> getTabInfo() async {
    _loadingTab = true;
    notifyListeners();
    final populerResponse = await ApiServices.getRequest("https://api.themoviedb.org/3/tv/popular");

    log(populerResponse.statusCode.toString());
    if(populerResponse.success) {
      _populerList.clear();
      log("In Room" + populerResponse.body.toString());
      List ls = populerResponse.body?["results"] ?? [];
      log(ls.length.toString());
      for (var element in ls) {
        _populerList.add(SeriseModel.fromJson(element));
      }
    }
    // final onAirResponse = await ApiServices.getRequest(Urls.tvUrl("on_the_air"));
    // if(onAirResponse.success) {
    //   _onAir.clear();
    //   List ls = populerResponse.body?["results"] ?? [];
    //   for (var element in ls) {
    //     _onAir.add(SeriseModel.fromJson(element));
    //   }
    // }
    // final topResponse = await ApiServices.getRequest(Urls.tvUrl("top_rated"));
    // if(topResponse.success) {
    //   _topRated.clear();
    //   List ls = populerResponse.body?["results"] ?? [];
    //   for (var element in ls) {
    //     _topRated.add(SeriseModel.fromJson(element));
    //   }
    // }
    _loadingTab = false;
    notifyListeners();
  }

  Future<void> getSeriseInfo(int id) async {
    _loadingScreen = true;
    notifyListeners();
  }
}