import 'package:flutter/material.dart';

import '../../models/person/person_details_model.dart';
import '../../models/list_item/person_model.dart';
import '../../services/api_services.dart';
import '../../utils/urls.dart';

class PersonRoomController extends ChangeNotifier {
  final List<PersonModel> _populer = [];
  String _profileImageUrl = "";
  bool _pageLoading = false;

  PersonDetailsModel _pageDetails = PersonDetailsModel();

  List<PersonModel> get populer => _populer;
  bool get pageLoading => _pageLoading;
  PersonDetailsModel get currentPage => _pageDetails;
  String get profileImageUrl => _profileImageUrl;

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
    final responses =
        await ApiServices.getRequest(Urls.personUrls(id.toString()));

    if (responses.success) {
      _pageDetails = PersonDetailsModel.fromJson(responses.body?["person"]);
      if (_pageDetails.images?.isNotEmpty ?? false) {
        _profileImageUrl =
            Urls.getImageUrl(_pageDetails.images!.first.filePath!);
      } else {
        _profileImageUrl = Urls.noPosterUrl;
      }
    }

    _pageLoading = false;
    notifyListeners();
  }
}
