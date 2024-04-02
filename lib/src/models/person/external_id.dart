class ExtarnalID {
  int? id;
  String? imdbId;
  String? facebookId;
  String? instagramId;
  String? tiktokId;
  String? twitterId;
  String? youtubeId;

  ExtarnalID(
      {this.id,
      this.imdbId,
      this.facebookId,
      this.instagramId,
      this.tiktokId,
      this.twitterId,
      this.youtubeId});

  ExtarnalID.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imdbId = json['imdb_id'];
    facebookId = json['facebook_id'];
    instagramId = json['instagram_id'];
    tiktokId = json['tiktok_id'];
    twitterId = json['twitter_id'];
    youtubeId = json['youtube_id'];
  }

  bool get isNotNull {
    if (imdbId != null ||
        facebookId != null ||
        instagramId != null ||
        tiktokId != null ||
        twitterId != null ||
        youtubeId != null) {
      return true;
    }
    return false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['facebook_id'] = facebookId;
    data['instagram_id'] = instagramId;
    data['tiktok_id'] = tiktokId;
    data['twitter_id'] = twitterId;
    data['youtube_id'] = youtubeId;
    return data;
  }
}
