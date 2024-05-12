class SearchModel {
  int? id;
  String? mediaType;
  bool? adult;
  String? name;
  double? popularity;
  int? votePercentage;
  String? posterPath;
  String? title;
  String? overview;

  SearchModel({
    this.id,
    this.mediaType,
    this.adult,
    this.name,
    this.popularity,
    this.votePercentage,
    this.overview,
    this.posterPath,
    this.title,
  });

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaType = json['media_type'];
    adult = json['adult'];
    name = json['name'];
    popularity = double.parse(json['populariry']?.toString() ?? "0");
    votePercentage = json['vote_percentage'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_type'] = mediaType;
    data['adult'] = adult;
    data['name'] = name;
    data['popularity'] = popularity;
    data['vote_percentage'] = votePercentage;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['title'] = title;
    return data;
  }
}
