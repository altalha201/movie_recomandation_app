class MovieModel {
  int? id;
  String? posterPath;
  String? title;
  int? votePercentage;

  MovieModel({
    this.id,
    this.posterPath,
    this.title,
    this.votePercentage,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    posterPath = json['poster_path'];
    title = json['title'];
    votePercentage = json['vote_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['poster_path'] = posterPath;
    data['title'] = title;
    data['vote_percentage'] = votePercentage;
    return data;
  }
}
