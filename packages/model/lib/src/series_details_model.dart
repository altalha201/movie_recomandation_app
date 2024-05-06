import 'model.dart';

class SeriesDetailsModel {
  bool? isNull;
  int? id;
  String? name;
  bool? adult;
  List<int>? episodeRunTime;
  String? firstAirDate;
  String? lastAirDate;
  bool? inProduction;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  String? originalLanguage;
  String? originalName;
  String? mainPosterPath;
  String? status;
  String? tagline;
  String? type;
  int? votePercentage;
  String? overview;
  List<GenreModel>? genres;
  List<String>? languages;
  List<NetworkModel>? networks;
  List<CompanyModel>? productionCompanies;
  List<SeasonModel>? seasons;
  List<ImageModel>? images;
  List<VideoModel>? videos;
  List<MediaModel>? similar;
  List<MediaModel>? recommendations;

  SeriesDetailsModel({
    this.id,
    this.name,
    this.adult,
    this.episodeRunTime,
    this.firstAirDate,
    this.lastAirDate,
    this.inProduction,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originalLanguage,
    this.originalName,
    this.mainPosterPath,
    this.status,
    this.tagline,
    this.type,
    this.votePercentage,
    this.overview,
    this.genres,
    this.languages,
    this.networks,
    this.productionCompanies,
    this.seasons,
    this.images,
    this.videos,
    this.similar,
    this.recommendations,
    this.isNull = false,
  });

  SeriesDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isNull = false;
    name = json['name'];
    adult = json['adult'];
    episodeRunTime = json['episode_run_time'].cast<int>();
    firstAirDate = json['first_air_date'];
    lastAirDate = json['last_air_date'];
    inProduction = json['in_production'];
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    mainPosterPath = json['main_poster_path'];
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
    votePercentage = json['vote_percentage'];
    overview = json['overview'];
    if (json['genres'] != null) {
      genres = <GenreModel>[];
      json['genres'].forEach((v) {
        genres!.add(GenreModel.fromJson(v));
      });
    }
    languages = json['languages'].cast<String>();
    if (json['networks'] != null) {
      networks = <NetworkModel>[];
      json['networks'].forEach((v) {
        networks!.add(NetworkModel.fromJson(v));
      });
    }
    if (json['production_companies'] != null) {
      productionCompanies = <CompanyModel>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(CompanyModel.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = <SeasonModel>[];
      json['seasons'].forEach((v) {
        seasons!.add(SeasonModel.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <ImageModel>[];
      json['images'].forEach((v) {
        images!.add(ImageModel.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = <VideoModel>[];
      json['videos'].forEach((v) {
        videos!.add(VideoModel.fromJson(v));
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
    data['name'] = name;
    data['adult'] = adult;
    data['episode_run_time'] = episodeRunTime;
    data['first_air_date'] = firstAirDate;
    data['last_air_date'] = lastAirDate;
    data['in_production'] = inProduction;
    data['number_of_episodes'] = numberOfEpisodes;
    data['number_of_seasons'] = numberOfSeasons;
    data['original_language'] = originalLanguage;
    data['original_name'] = originalName;
    data['main_poster_path'] = mainPosterPath;
    data['status'] = status;
    data['tagline'] = tagline;
    data['type'] = type;
    data['vote_percentage'] = votePercentage;
    data['overview'] = overview;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['languages'] = languages;
    if (networks != null) {
      data['networks'] = networks!.map((v) => v.toJson()).toList();
    }
    if (productionCompanies != null) {
      data['production_companies'] =
          productionCompanies!.map((v) => v.toJson()).toList();
    }
    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }
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
