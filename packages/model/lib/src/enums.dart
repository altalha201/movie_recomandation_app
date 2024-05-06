enum MovieCetagories {
  popular("popular"),
  topRated("top_rated"),
  upcoming("upcoming"),
  nowPlaying("now_playing");

  final String name;
  const MovieCetagories(this.name);
}

enum SeriesCetagories {
  popular("popular"),
  topRated("top_rated"),
  airingToday("airing_today"),
  onTheAir("on_the_air");

  final String name;
  const SeriesCetagories(this.name);
}

enum TrandingTimeFrame {
  day,
  week;

  String get name => toString().split(".").last;
}

enum MediaType {
  movie,
  tv,
  person,
  none;

  String get name => toString().split(".").last;

  static MediaType fromString(String name) {
    switch (name) {
      case 'movie':
        return MediaType.movie;
      case 'tv':
        return MediaType.tv;
      case 'person':
        return MediaType.person;
      default:
        return MediaType.none;
    }
  }
}
