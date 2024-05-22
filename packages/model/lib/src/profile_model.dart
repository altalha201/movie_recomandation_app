class ProfileModel {
  String? sId;
  String? fullName;
  String? userName;
  String? gender;
  int? profileImgId;
  String? createdAt;
  String? updatedAt;
  bool? isNull;

  ProfileModel({
    this.sId,
    this.fullName,
    this.userName,
    this.gender,
    this.profileImgId,
    this.createdAt,
    this.updatedAt,
    this.isNull = false,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    userName = json['userName'];
    gender = json['gender'];
    profileImgId = json['profileImgId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    return data;
  }
}
