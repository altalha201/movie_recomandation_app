import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';

class ProfileRepositort {
  const ProfileRepositort();

  static Future<ProfileModel> getProfile(String token) async {
    Map<String, String> headers = {"token": token};

    final response = await ApiServices.getRequest(
      EndPoints.profile,
      headers: headers,
    );
    if (response.success) {
      return ProfileModel.fromJson(response.body?["user"]);
    } else {
      return ProfileModel(isNull: true);
    }
  }

  static Future<ProfileModel> updateInfo(
    String token, {
    String? fullName,
    GenderType? gender,
    int? profileId,
  }) async {
    Map<String, dynamic> updateBody = {};
    if (fullName != null) {
      updateBody['fullName'] = fullName;
    }
    if (gender != null) {
      updateBody['gender'] = gender.string;
    }
    if (profileId != null) {
      updateBody['profileImgId'] = profileId;
    }

    final response = await ApiServices.postRequest(
      EndPoints.profileUpdate,
      body: updateBody,
    );

    if (response.success) {
      return ProfileModel.fromJson(response.body?['user']);
    } else {
      return ProfileModel(isNull: true);
    }
  }

  static Future<bool> deleteUser(String token, String password) async {
    Map<String, dynamic> body = {'password': password};
    final response = await ApiServices.postRequest(
      EndPoints.profileDelete,
      body: body,
    );

    return response.success;
  }
}
