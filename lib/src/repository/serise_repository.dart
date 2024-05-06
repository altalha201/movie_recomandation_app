import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:navigate/navigate.dart';

class SeriesRepository {
  const SeriesRepository();

  static Future<List<SeriesModel>> getListOfSeries(
    SeriesCetagories cetagory,
  ) async {
    final hasConnection = await Connection.hasInternet();
    if (hasConnection) {
      return await _fetchListFromAPI(cetagory.name);
    } else {
      return [];
    }
  }

  static Future<SeriesDetailsModel> getSeriesByID(
    int id,
  ) async {
    final hasConnection = await Connection.hasInternet();

    if (hasConnection) {
      return await _fetchSeriesByID(id);
    } else {
      return SeriesDetailsModel(isNull: true);
    }
  }

  static Future<SeriesDetailsModel> _fetchSeriesByID(int id) async {
    final response = await ApiServices.getRequest(
      EndPoints.tvUrl(
        id.toString(),
      ),
    );

    if (response.success) {
      return SeriesDetailsModel.fromJson(response.body?["serise"]);
    } else {
      MSToast.errorToast("Something went wrong!");
      return SeriesDetailsModel(isNull: true);
    }
  }

  static Future<List<SeriesModel>> _fetchListFromAPI(String cetagory) async {
    final response = await ApiServices.getRequest(
      EndPoints.tvUrl(cetagory),
    );
    final List<SeriesModel> list = [];
    if (response.success) {
      List ls = response.body?["results"] ?? [];
      for (var element in ls) {
        list.add(SeriesModel.fromJson(element));
      }
    }
    return list;
  }
}
