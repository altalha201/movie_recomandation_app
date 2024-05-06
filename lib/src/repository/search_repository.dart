import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:navigate/navigate.dart';

class SearchRepository {
  const SearchRepository();

  static Future<List<SearchModel>> search(
    String keyword, {
    bool includeAdult = true,
  }) async {
    final connection = await Connection.hasInternet();

    if (connection) {
      return await _searchAPI(keyword, includeAdult);
    } else {
      return [];
    }
  }

  static Future<List<SearchModel>> _searchAPI(
    String keyword,
    bool includeAdult,
  ) async {
    Map<String, dynamic> perams = {
      "include_adult": includeAdult.toString(),
      "keyword": keyword,
    };
    final res = await ApiServices.getRequest(EndPoints.search, params: perams);
    final List<SearchModel> list = [];
    if (res.success) {
      List searchResults = res.body?["results"] ?? [];

      for (var element in searchResults) {
        var mediaType = MediaType.fromString(element['media_type']);
        if (mediaType case MediaType.tv || MediaType.movie) {
          list.add(SearchModel.fromJson(element));
        }
      }
    } else {
      MSToast.errorToast("Error while searching");
    }
    return list;
  }
}
