import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../repository/search_repository.dart';

class SearchFunctionController extends ChangeNotifier {
  List<SearchModel> _searchList = [];

  bool _searching = false;

  List<SearchModel> get searchList => _searchList;
  bool get searching => _searching;

  Future<void> onSearch(String value) async {
    _searching = true;
    notifyListeners();
    _searchList = await SearchRepository.search(value);
    _searching = false;
    notifyListeners();
  }

  void clearSearchList() {
    _searchList.clear();
    notifyListeners();
  }
}
