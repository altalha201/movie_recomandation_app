import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

class SearchFunctionController extends ChangeNotifier {
  final List<SearchModel> _searchList = [];

  bool _searching = false;

  List<SearchModel> get searchList => _searchList;
  bool get searching => _searching;

  Future<void> onSearch(String value) async {
    _searchList.clear();
    _searching = true;
    notifyListeners();
    Map<String, dynamic> perams = {
      "include_adult": "true",
      "keyword": value,
    };
    final res = await ApiServices.getRequest(EndPoints.search, params: perams);
    if (res.success) {
      List searchResults = res.body?["results"] ?? [];

      for (var element in searchResults) {
        if (element['media_type'] case 'tv' || 'movie') {
          _searchList.add(SearchModel.fromJson(element));
        }
      }
    } else {
      MSToast.errorToast("Error while searching");
    }
    _searching = false;
    notifyListeners();
  }

  void clearSearchList() {
    _searchList.clear();
    notifyListeners();
  }
}
