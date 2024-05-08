class SeriesModel {
  bool? adult;
  String? backdropPath;
  int? id;
  String? overview;
  String? posterPath;
  String? name;
  int? votePercentage;

  SeriesModel(
      {this.adult,
      this.backdropPath,
      this.id,
      this.overview,
      this.posterPath,
      this.name,
      this.votePercentage});

  SeriesModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    name = json['name'];
    votePercentage = json['vote_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['name'] = name;
    data['vote_percentage'] = votePercentage;
    return data;
  }
}
