class ExternalIdsModel {
  String? imdbId;
  String? facebookId;
  String? instagramId;
  String? tiktokId;
  String? twitterId;
  String? youtubeId;

  ExternalIdsModel({
    this.imdbId,
    this.facebookId,
    this.instagramId,
    this.tiktokId,
    this.twitterId,
    this.youtubeId,
  });

  bool get isNotNull {
    if (imdbId == null &&
        facebookId == null &&
        instagramId == null &&
        tiktokId == null &&
        twitterId == null &&
        youtubeId == null) {
      return false;
    }
    return true;
  }

  ExternalIdsModel.fromJson(Map<String, dynamic> json) {
    imdbId = json['imdb_id'];
    facebookId = json['facebook_id'];
    instagramId = json['instagram_id'];
    tiktokId = json['tiktok_id'];
    twitterId = json['twitter_id'];
    youtubeId = json['youtube_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imdb_id'] = imdbId;
    data['facebook_id'] = facebookId;
    data['instagram_id'] = instagramId;
    data['tiktok_id'] = tiktokId;
    data['twitter_id'] = twitterId;
    data['youtube_id'] = youtubeId;
    return data;
  }
}
