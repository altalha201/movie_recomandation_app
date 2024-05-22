import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

class AuthRepository {
  const AuthRepository();

  static Future<String?> signIn({
    required String userName,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      "userName": userName,
      "password": password,
    };
    return await _getToken(EndPoints.login, data);
  }

  static Future<String?> signup({
    required String name,
    required String userName,
    required String password,
    required String confirmPassword,
    required GenderType gender,
  }) async {
    int profileImageId = MSFunctions.genarateProfile(
      female: gender == GenderType.female,
    );

    Map<String, dynamic> data = {
      "userName": userName,
      "fullName": name,
      "password": password,
      "confirmPassword": confirmPassword,
      "gender": gender.string,
      "profileImgId": profileImageId,
    };

    return await _getToken(EndPoints.signUp, data);
  }

  static Future<String?> _getToken(
    String endPoint,
    Map<String, dynamic> data,
  ) async {
    final response = await ApiServices.postRequest(
      endPoint,
      body: data,
    );

    if (response.success) {
      return response.body?['token'];
    } else {
      return null;
    }
  }
}
