import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:navigate/navigate.dart';

class MovieRepository {
  const MovieRepository();

  static Future<List<MovieModel>> getMovies(MovieCetagories movieList) async {
    final hasConnection = await Connection.hasInternet();
    if (hasConnection) {
      return await _getListFromAPI(movieList);
    } else {
      return [];
    }
  }

  static Future<MovieDetailsModel> getMovieByID(int id) async {
    final hasConnection = await Connection.hasInternet();
    if (hasConnection) {
      return await _getMovieFromAPI(id);
    } else {
      return MovieDetailsModel(isNull: true);
    }
  }

  static Future<MovieDetailsModel> _getMovieFromAPI(int id) async {
    final response = await ApiServices.getRequest(
      EndPoints.movieUrls(id.toString()),
    );
    if (response.success) {
      return MovieDetailsModel.fromJson(response.body?['movie']);
    } else {
      return MovieDetailsModel(isNull: true);
    }
  }

  static Future<List<MovieModel>> _getListFromAPI(
      MovieCetagories chatagory) async {
    var perams = <String, dynamic>{};
    if (chatagory == MovieCetagories.nowPlaying ||
        chatagory == MovieCetagories.upcoming) {
      perams['region'] = 'bd';
    }
    final response = await ApiServices.getRequest(
      EndPoints.movieUrls(chatagory.name),
      params: perams,
    );
    List<MovieModel> list = [];
    if (response.success) {
      List ls = response.body?["results"] ?? [];
      for (var element in ls) {
        list.add(MovieModel.fromJson(element));
      }
    }
    return list;
  }
}
