import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';

class FavouriteRepository {
  const FavouriteRepository();

  static Future<bool> addToFavourite(
    String token,
    MediaType mediaType,
    int id,
  ) async {
    final header = {"token": token};
    final response = await ApiServices.getRequest(
      EndPoints.addToFavourite(
        mediaType.name,
        id,
      ),
      headers: header,
    );

    return response.success;
  }

  static Future<bool> removeFromFavourite(
    String token,
    MediaType mediaType,
    int id,
  ) async {
    final header = {"token": token};
    final response = await ApiServices.getRequest(
      EndPoints.removeFromFavourite(
        mediaType.name,
        id,
      ),
      headers: header,
    );

    return response.success;
  }

  static Future<List<MovieModel>> getFavouriteMovies(String token) async {
    List<MovieModel> list = [];
    final res = await ApiServices.getRequest(
      EndPoints.getFavouriteList(MediaType.movie.name),
      headers: {'token': token},
    );
    if (res.success) {
      res.body?['mediaList'].forEach(
        (element) => list.add(MovieModel.fromJson(element)),
      );
    }
    return list;
  }

  static Future<List<SeriesModel>> getFavouriteTvs(String token) async {
    List<SeriesModel> list = [];
    final res = await ApiServices.getRequest(
      EndPoints.getFavouriteList(MediaType.tv.name),
      headers: {'token': token},
    );
    if (res.success) {
      res.body?['mediaList'].forEach(
        (element) => list.add(SeriesModel.fromJson(element)),
      );
    }
    return list;
  }

  static Future<List<PersonModel>> getFavouritePersons(String token) async {
    List<PersonModel> list = [];
    final res = await ApiServices.getRequest(
      EndPoints.getFavouriteList(MediaType.person.name),
      headers: {'token': token},
    );
    if (res.success) {
      res.body?['mediaList'].forEach(
        (element) => list.add(PersonModel.fromJson(element)),
      );
    }
    return list;
  }
}
