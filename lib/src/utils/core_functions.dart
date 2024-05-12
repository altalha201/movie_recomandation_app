import 'package:collection/collection.dart';
import 'package:model/model.dart';

class CoreFunctions {
  const CoreFunctions();

  static String getTraillerKey(List<VideoModel>? videos) {
    if (videos?.isEmpty ?? true) {
      return "";
    }
    var traillerVideo = videos?.firstWhereOrNull(
      (element) => element.type == "Trailer",
    );

    traillerVideo ??= videos?.firstWhereOrNull(
      (element) => element.type == 'Teaser',
    );

    traillerVideo ??= videos?.firstWhereOrNull(
      (element) => element.type == 'Opening Credits',
    );

    return traillerVideo?.key ?? "";
  }

  static List<String> getGeners(List<GenreModel>? genres) {
    List<String> lst = [];
    genres?.forEach((element) {
      lst.add(element.name ?? "");
    });
    return lst;
  }

  static String getCompanies(List<CompanyModel>? companies) {
    List<String> lst = [];
    companies?.forEach((element) {
      lst.add(element.name ?? "");
    });
    if (lst.isEmpty) {
      return "";
    } else {
      return lst.join(", ");
    }
  }
}
