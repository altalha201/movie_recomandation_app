import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';

import '../../repository/people_repository.dart';

class PersonRoomController extends ChangeNotifier {
  List<PersonModel> _populer = [];
  String _profileImageUrl = "";
  bool _pageLoading = false;

  PersonDetailsModel _pageDetails = PersonDetailsModel();

  List<PersonModel> get populer => _populer;
  bool get pageLoading => _pageLoading;
  PersonDetailsModel get currentPage => _pageDetails;
  String get profileImageUrl => _profileImageUrl;

  Future<void> getPopulerList() async {
    _populer = await PeopleRepository.getPopulerPersons();
    notifyListeners();
  }

  Future<void> getPersonId(int id) async {
    _pageLoading = true;
    notifyListeners();
    _pageDetails = await PeopleRepository.getPersonByID(id);

    if (_pageDetails.images?.isNotEmpty ?? false) {
        _profileImageUrl =
            EndPoints.getImageUrl(_pageDetails.images!.first.filePath!);
      } else {
        _profileImageUrl = EndPoints.noPosterUrl;
      }

    _pageLoading = false;
    notifyListeners();
  }
}
