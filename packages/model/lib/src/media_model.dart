class MediaModel {
  int? id;
  String? mediaType;
  String? mediaTitle;
  String? posterPath;
  int? votePercentage;
  String? releaseDate;

  MediaModel({
    this.id,
    this.mediaType,
    this.mediaTitle,
    this.posterPath,
    this.votePercentage,
    this.releaseDate,
  });

  MediaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaType = json['media_type'];
    mediaTitle = json['media_title'];
    posterPath = json['poster_path'];
    votePercentage = json['vote_percentage'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_type'] = mediaType;
    data['media_title'] = mediaTitle;
    data['poster_path'] = posterPath;
    data['vote_percentage'] = votePercentage;
    data['release_date'] = releaseDate;
    return data;
  }
}
