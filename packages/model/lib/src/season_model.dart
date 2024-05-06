class SeasonModel {
  String? airDate;
  int? episodeCount;
  String? name;
  String? posterPath;
  int? votePercentage;

  SeasonModel(
      {this.airDate,
      this.episodeCount,
      this.name,
      this.posterPath,
      this.votePercentage});

  SeasonModel.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeCount = json['episode_count'];
    name = json['name'];
    posterPath = json['poster_path'];
    votePercentage = json['vote_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['air_date'] = airDate;
    data['episode_count'] = episodeCount;
    data['name'] = name;
    data['poster_path'] = posterPath;
    data['vote_percentage'] = votePercentage;
    return data;
  }
}
