class CompanyModel {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  CompanyModel({this.id, this.logoPath, this.name, this.originCountry});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }
}
