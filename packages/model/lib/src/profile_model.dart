class ProfileModel {
  String? sId;
  String? fullName;
  String? userName;
  String? gender;
  int? profileImgId;
  String? createdAt;
  String? updatedAt;
  bool? isNull;
  List<int>? favouriteMovies;
  List<int>? favouriteTvSerises;
  List<int>? favouritePersonalitys;
  List<int>? movieWatchList;
  List<int>? tvWatchList;

  ProfileModel({
    this.sId,
    this.fullName,
    this.userName,
    this.gender,
    this.profileImgId,
    this.createdAt,
    this.updatedAt,
    this.isNull = false,
    this.favouriteMovies,
    this.favouritePersonalitys,
    this.favouriteTvSerises,
    this.movieWatchList,
    this.tvWatchList,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    userName = json['userName'];
    gender = json['gender'];
    profileImgId = json['profileImgId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    favouriteMovies = json['favouriteMovies'];
    favouritePersonalitys = json['favouritePersonalitys'];
    favouriteTvSerises = json['favouriteTvSerises'];
    movieWatchList = json['movieWatchList'];
    tvWatchList = json['tvWatchList'];
    isNull = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullName'] = fullName;
    data['userName'] = userName;
    data['gender'] = gender;
    data['profileImgId'] = profileImgId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['favouriteMovies'] = favouriteMovies;
    data['favouritePersonalitys'] = favouritePersonalitys;
    data['favouriteTvSerises'] = favouriteTvSerises;
    data['movieWatchList'] = movieWatchList;
    data['tvWatchList'] = tvWatchList;
    return data;
  }
}
