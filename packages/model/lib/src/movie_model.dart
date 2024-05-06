class MovieModel {
  int? id;
  double? popularity;
  String? posterPath;
  String? title;
  int? votePercentage;

  MovieModel({
    this.id,
    this.popularity,
    this.posterPath,
    this.title,
    this.votePercentage,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    title = json['title'];
    votePercentage = json['vote_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['title'] = title;
    data['vote_percentage'] = votePercentage;
    return data;
  }
}
