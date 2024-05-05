import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

class TrandingController extends ChangeNotifier {
  final List<TrandingModel> _trandingList = [];
  bool _isLoading = false;

  List<TrandingModel> get trandingList => _trandingList;
  bool get isLoading => _isLoading;

  Future<void> getTrandings({String timeWindow = "day"}) async {
    _isLoading = true;
    _trandingList.clear();
    notifyListeners();
    var res = await ApiServices.getRequest(EndPoints.trainding(timeWindow));
    if (res.success) {
      var currentJsonList = res.body?["tranding"] ?? [];
      for (var element in currentJsonList) {
        _trandingList.add(TrandingModel.fromJson(element));
      }
    } else {
      MSToast.showToast("Something went wrong");
    }
    _isLoading = false;
    notifyListeners();
  }
}
