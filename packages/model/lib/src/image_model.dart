class ImageModel {
  double? aspectRatio;
  int? height;
  String? filePath;
  int? votePercentage;
  int? width;

  ImageModel({
    this.aspectRatio,
    this.height,
    this.filePath,
    this.votePercentage,
    this.width,
  });

  ImageModel.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    filePath = json['file_path'];
    votePercentage = json['vote_percentage'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aspect_ratio'] = aspectRatio;
    data['height'] = height;
    data['file_path'] = filePath;
    data['vote_percentage'] = votePercentage;
    data['width'] = width;
    return data;
  }
}
