class TrandingListItem {
  int? id;
  String? mediaType;
  String? posterPath;
  int? votePercentage;
  String? mediaTitle;
  String? releaseDate;

  TrandingListItem(
      {this.id,
      this.mediaType,
      this.posterPath,
      this.votePercentage,
      this.mediaTitle,
      this.releaseDate});

  TrandingListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaType = json['media_type'];
    posterPath = json['poster_path'];
    votePercentage = json['vote_percentage'];
    mediaTitle = json['media_title'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_type'] = mediaType;
    data['poster_path'] = posterPath;
    data['vote_percentage'] = votePercentage;
    data['media_title'] = mediaTitle;
    data['release_date'] = releaseDate;
    return data;
  }
}
