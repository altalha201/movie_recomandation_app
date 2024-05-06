import 'model.dart';

class MovieDetailsModel {
  bool? isNull;
  int? id;
  bool? adult;
  int? budget;
  List<GenreModel>? genres;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? mainPoster;
  List<CompanyModel>? productionCompanies;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? title;
  String? tagline;
  int? votePercentage;
  List<ImageModel>? images;
  List<VedioModel>? videos;
  List<MediaModel>? similar;
  List<MediaModel>? recommendations;

  MovieDetailsModel({
    this.id,
    this.adult,
    this.budget,
    this.genres,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.mainPoster,
    this.productionCompanies,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.title,
    this.tagline,
    this.votePercentage,
    this.images,
    this.videos,
    this.similar,
    this.recommendations,
    this.isNull = false,
  });

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adult = json['adult'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <GenreModel>[];
      json['genres'].forEach((v) {
        genres!.add(GenreModel.fromJson(v));
      });
    }
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    mainPoster = json['main_poster'];
    if (json['production_companies'] != null) {
      productionCompanies = <CompanyModel>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(CompanyModel.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    status = json['status'];
    title = json['title'];
    tagline = json['tagline'];
    votePercentage = json['vote_percentage'];
    isNull = false;
    if (json['images'] != null) {
      images = <ImageModel>[];
      json['images'].forEach((v) {
        images!.add(ImageModel.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = <VedioModel>[];
      json['videos'].forEach((v) {
        videos!.add(VedioModel.fromJson(v));
      });
    }
    if (json['similar'] != null) {
      similar = <MediaModel>[];
      json['similar'].forEach((v) {
        similar!.add(MediaModel.fromJson(v));
      });
    }
    if (json['recommendations'] != null) {
      recommendations = <MediaModel>[];
      json['recommendations'].forEach((v) {
        recommendations!.add(MediaModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['adult'] = adult;
    data['budget'] = budget;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['main_poster'] = mainPoster;
    if (productionCompanies != null) {
      data['production_companies'] =
          productionCompanies!.map((v) => v.toJson()).toList();
    }
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['status'] = status;
    data['title'] = title;
    data['tagline'] = tagline;
    data['vote_percentage'] = votePercentage;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    if (similar != null) {
      data['similar'] = similar!.map((v) => v.toJson()).toList();
    }
    if (recommendations != null) {
      data['recommendations'] =
          recommendations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
