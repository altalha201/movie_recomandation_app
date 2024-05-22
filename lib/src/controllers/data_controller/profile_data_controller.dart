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
}
