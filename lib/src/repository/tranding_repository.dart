import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:navigate/navigate.dart';

class TrandingRepository {
  const TrandingRepository();

  static Future<List<TrandingModel>> getTrandingList({
    TrandingTimeFrame timeFrame = TrandingTimeFrame.day,
  }) async {
    final hasConnection = await Connection.hasInternet();
    if (hasConnection) {
      return _getFromApi(timeFrame.name);
    } else {
      return [];
    }
  }

  static Future<List<TrandingModel>> _getFromApi(String timeFrame) async {
    var res = await ApiServices.getRequest(EndPoints.trainding(timeFrame));
    List<TrandingModel> list = [];
    if (res.success) {
      var currentJsonList = res.body?["tranding"] ?? [];
      for (var element in currentJsonList) {
        list.add(TrandingModel.fromJson(element));
      }
    } else {
      MSToast.showToast("Something went wrong");
    }
    return list;
  }
}
