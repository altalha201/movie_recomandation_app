import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

import '../../utils/exports.dart';

class ProfileDataController extends ChangeNotifier {
  String _token = "";
  bool _isGetingProfile = false;
  ProfileModel _currentUser = ProfileModel(isNull: true);

  bool get gettingProfile => _isGetingProfile;
  ProfileModel get userProfile => _currentUser;

  void _getToken() {
    _token = LocalRepository.getToken() ?? "";
  }

  Future<void> getUserProfileData() async {
    _isGetingProfile = true;
    notifyListeners();
    _getToken();
    if (_token != "") {
      _currentUser = await ProfileRepositort.getProfile(_token);
    }
    _isGetingProfile = false;
    notifyListeners();
  }

  Future<void> updateUserProfileImage() async {
    if (!(_currentUser.isNull ?? true) || _token != "") {
      int newProfileId = MSFunctions.genarateProfile(
        female: _currentUser.fullName == "female",
      );
      _currentUser = await ProfileRepositort.updateInfo(
        _token,
        profileId: newProfileId,
      );
    }
    notifyListeners();
  }

  bool isAtList(MediaType mediaType, int id, {bool isWatchList = false}) {
    if (isWatchList) {
      switch (mediaType) {
        case MediaType.movie:
          return _currentUser.movieWatchList?.contains(id) ?? false;
        case MediaType.tv:
          return _currentUser.tvWatchList?.contains(id) ?? false;
        case MediaType.person:
          return false;
        case MediaType.none:
          return false;
      }
    } else {
      switch (mediaType) {
        case MediaType.movie:
          return _currentUser.favouriteMovies?.contains(id) ?? false;
        case MediaType.tv:
          return _currentUser.favouriteTvSerises?.contains(id) ?? false;
        case MediaType.person:
          return _currentUser.favouritePersonalitys?.contains(id) ?? false;
        case MediaType.none:
          return false;
      }
    }
  }
}
