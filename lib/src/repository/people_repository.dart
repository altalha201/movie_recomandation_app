import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:navigate/navigate.dart';

class PeopleRepository {
  const PeopleRepository();

  static Future<List<PersonModel>> getPopulerPersons() async {
    final hasConnection = await Connection.hasInternet();
    const cetagory = 'popular';
    if (hasConnection) {
      return await _getListFromAPI(cetagory);
    } else {
      return [];
    }
  }

  static Future<PersonDetailsModel> getPersonByID(int id) async {
    final hasConnection = await Connection.hasInternet();
    if (hasConnection) {
      return await _getPersonFromAPI(id);
    } else {
      return PersonDetailsModel(isNull: true);
    }
  }

  static Future<List<PersonModel>> _getListFromAPI(String cetagory) async {
    final response = await ApiServices.getRequest(
      EndPoints.personUrls(cetagory),
    );

    final List<PersonModel> list = [];
    if (response.success) {
      List<dynamic> ls = response.body?['results'] ?? [];
      for (var element in ls) {
        list.add(PersonModel.fromJson(element));
      }
    }
    return list;
  }

  static Future<PersonDetailsModel> _getPersonFromAPI(int id) async {
    final response = await ApiServices.getRequest(
      EndPoints.personUrls(
        id.toString(),
      ),
    );
    if (response.success) {
      return PersonDetailsModel.fromJson(response.body?['person']);
    } else {
      return PersonDetailsModel(isNull: true);
    }
  }
}
