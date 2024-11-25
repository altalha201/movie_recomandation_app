import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../utils/exports.dart';

class FavouriteController extends ChangeNotifier {
  List<MovieModel> _movies = [];
  List<PersonModel> _persons = [];
  List<SeriesModel> _tvs = [];

  List<MovieModel> get favouriteMovies => _movies;
  List<PersonModel> get favouritePersons => _persons;
  List<SeriesModel> get favouriteTvs => _tvs;

  Future<void> getFavouriteList() async {
    var token = LocalRepository.getToken() ?? "";
    final lists = await Future.wait([
      FavouriteRepository.getFavouriteMovies(token),
      FavouriteRepository.getFavouritePersons(token),
      FavouriteRepository.getFavouriteTvs(token),
    ]);

    _movies = lists[0] as List<MovieModel>;
    _persons = lists[1] as List<PersonModel>;
    _tvs = lists[2] as List<SeriesModel>;
    notifyListeners();
  }

  Future<bool> addToFavourite(MediaType mediaType, int id) async {
    var token = LocalRepository.getToken() ?? "";
    return await FavouriteRepository.addToFavourite(token, mediaType, id);
  }
  
  Future<bool> deleteFromFavourite(MediaType mediaType, int id) async {
    var token = LocalRepository.getToken() ?? "";
    return await FavouriteRepository.removeFromFavourite(token, mediaType, id);
  }
}
