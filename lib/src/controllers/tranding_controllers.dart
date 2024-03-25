import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/media_model.dart';
import '../models/tranding_model.dart';
import '../services/api_services.dart';
import '../utils/urls.dart';

class TrandingController extends ChangeNotifier{
  final List<MediaModel> _trandingList = [];
  bool _isLoading = false;

  List<MediaModel> get trandingList => _trandingList;
  bool get isLoading => _isLoading;

  Future<void> getTrandings({String timeWindow = "day"}) async {
    _isLoading = true;
    _trandingList.clear();
    notifyListeners();
    var res = await ApiServices.getRequest(Urls.trainding(timeWindow));
    if (res.success) {
      TrandingModel model = TrandingModel.fromJson(res.body ?? {});
      _trandingList.addAll(model.results ?? []);
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    _isLoading = false;
    notifyListeners();
  }
}