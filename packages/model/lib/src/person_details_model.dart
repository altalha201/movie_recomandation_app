import 'model.dart';

class PersonDetailsModel {
  int? id;
  String? name;
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  String? deathday;
  String? gender;
  String? knownForDepartment;
  String? placeOfBirth;
  ExternalIdsModel? externalIds;
  List<ImageModel>? images;
  List<MediaModel>? knownFor;

  PersonDetailsModel({
    this.id,
    this.name,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.knownForDepartment,
    this.placeOfBirth,
    this.externalIds,
    this.images,
    this.knownFor,
  });

  String get alsoKnownAsString {
    return alsoKnownAs?.join(", ") ?? "";
  }

  PersonDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alsoKnownAs = json['also_known_as'].cast<String>();
    biography = json['biography'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    knownForDepartment = json['known_for_department'];
    placeOfBirth = json['place_of_birth'];
    externalIds = json['external_ids'] != null
        ? ExternalIdsModel.fromJson(json['external_ids'])
        : null;
    if (json['images'] != null) {
      images = <ImageModel>[];
      json['images'].forEach((v) {
        images!.add(ImageModel.fromJson(v));
      });
    }
    if (json['known_for'] != null) {
      knownFor = <MediaModel>[];
      json['known_for'].forEach((v) {
        knownFor!.add(MediaModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['also_known_as'] = alsoKnownAs;
    data['biography'] = biography;
    data['birthday'] = birthday;
    data['deathday'] = deathday;
    data['gender'] = gender;
    data['known_for_department'] = knownForDepartment;
    data['place_of_birth'] = placeOfBirth;
    if (externalIds != null) {
      data['external_ids'] = externalIds!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (knownFor != null) {
      data['known_for'] = knownFor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
