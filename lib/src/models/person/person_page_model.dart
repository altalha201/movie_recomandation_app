import 'external_id.dart';
import 'images.dart';
import 'movie_credits.dart';
import 'person_details.dart';
import 'tv_credits.dart';

class PersonPageModel {
  int? id;
  PersonDetails? details;
  Images? images;
  ExtarnalID? extarnalID;
  MovieCredits? movieCredits;
  TVCredits? tvCredits;

  PersonPageModel({
    this.id,
    this.details,
    this.images,
    this.extarnalID,
    this.movieCredits,
    this.tvCredits,
  });

  PersonPageModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] != null) {
      json["id"] = id;
    }
    if (json["details"] != null) {
      details = PersonDetails.fromJson(json["details"]);
    }
    if (json["images"] != null) {
      images = Images.fromJson(json["images"]);
    }
    if (json["external"] != null) {
      extarnalID = ExtarnalID.fromJson(json["external"]);
    }
    if (json["movies"] != null) {
      movieCredits = MovieCredits.fromJson(json["movies"]);
    }
    if (json["tvs"] != null) {
      tvCredits = TVCredits.fromJson(json["tvs"]);
    }
  }
}
