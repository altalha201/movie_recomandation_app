import 'package:flutter/material.dart';

import '../models/media_model.dart';
import '../services/api_services.dart';
import '../utils/toast_manager.dart';
import '../utils/urls.dart';

class SearchFunctionController extends ChangeNotifier{
  final List<MediaModel> _searchList = [];

  bool _searching = false;

  List<MediaModel> get searchList => _searchList;
  bool get searching => _searching;

  Future<void> onSearch(String value) async {
    _searchList.clear();
    _searching = true;
    notifyListeners();
    final res = await ApiServices.getRequest(Urls.search(value));
    if(res.success) {
      List searchResults = res.body?["results"] ?? [];

      for (var element in searchResults) {
        if(element['media_type'] case 'tv' || 'movie') {
          _searchList.add(MediaModel.fromJson(element));
        }
      }

    } else {
      ToastManager.errorToast("Error while searching");
    }
    _searching = false;
    notifyListeners();
  }

  void clearSearchList() {
    _searchList.clear();
    notifyListeners();
  }
}