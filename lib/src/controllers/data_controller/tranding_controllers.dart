import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/list_item/tranding_model.dart';
import '../../services/api_services.dart';
import '../../utils/urls.dart';

class TrandingController extends ChangeNotifier {
  final List<TrandingModel> _trandingList = [];
  bool _isLoading = false;

  List<TrandingModel> get trandingList => _trandingList;
  bool get isLoading => _isLoading;

  Future<void> getTrandings({String timeWindow = "day"}) async {
    _isLoading = true;
    _trandingList.clear();
    notifyListeners();
    var res = await ApiServices.getRequest(Urls.trainding(timeWindow));
    if (res.success) {
      var currentJsonList = res.body?["tranding"] ?? [];
      for (var element in currentJsonList) {
        _trandingList.add(TrandingModel.fromJson(element));
      }
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    _isLoading = false;
    notifyListeners();
  }
}
