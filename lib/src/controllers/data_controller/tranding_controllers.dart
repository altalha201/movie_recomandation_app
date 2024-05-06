import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../repository/tranding_repository.dart';

class TrandingController extends ChangeNotifier {
  List<TrandingModel> _trandingList = [];
  bool _isLoading = false;

  List<TrandingModel> get trandingList => _trandingList;
  bool get isLoading => _isLoading;

  Future<void> getTrandings(
      {TrandingTimeFrame timeWindow = TrandingTimeFrame.day}) async {
    _isLoading = true;
    _trandingList.clear();
    notifyListeners();
    _trandingList =
        await TrandingRepository.getTrandingList(timeFrame: timeWindow);
    _isLoading = false;
    notifyListeners();
  }
}
