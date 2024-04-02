import 'package:flutter/material.dart';

import '../models/person/person_page_model.dart';
import '../models/person_model.dart';
import '../services/api_services.dart';
import '../utils/urls.dart';

class PersonRoomController extends ChangeNotifier {
  final List<PersonModel> _populer = [];
  bool _pageLoading = false;

  PersonPageModel _pageDetails = PersonPageModel();

  List<PersonModel> get populer => _populer;
  bool get pageLoading => _pageLoading;
  PersonPageModel get currentPage => _pageDetails;

  Future<void> getPopulerList() async {
    final response = await ApiServices.getRequest(Urls.personUrls("popular"));
    if (response.success) {
      _populer.clear();
      List ls = response.body?['results'] ?? [];
      for (var element in ls) {
        _populer.add(PersonModel.fromJson(element));
      }
    }
    notifyListeners();
  }

  Future<void> getPersonId(int id) async {
    _pageLoading = true;
    notifyListeners();
    final responses = await Future.wait([
      ApiServices.getRequest(Urls.personUrls(id.toString())),
      ApiServices.getRequest(Urls.personUrls("$id/tv_credits")),
      ApiServices.getRequest(Urls.personUrls("$id/movie_credits")),
      ApiServices.getRequest(Urls.personUrls("$id/external_ids")),
      ApiServices.getRequest(Urls.personUrls("$id/images")),
    ]);

    Map<String, dynamic> data = {};
    if (responses[0].success) data["details"] = responses[0].body;
    if (responses[1].success) data["tvs"] = responses[1].body;
    if (responses[2].success) data["movies"] = responses[2].body;
    if (responses[3].success) data["external"] = responses[3].body;
    if (responses[4].success) data["images"] = responses[4].body;
    data["id"] = id;

    _pageDetails = PersonPageModel.fromJson(data);
    _pageLoading = false;
    notifyListeners();
  }
}
