enum MovieList {
  popular("popular"),
  topRated("top_rated"),
  upcoming("upcoming"),
  nowPlaying("now_playing");

  final String name;
  const MovieList(this.name);
}

enum SeriseList {
  popular("popular"),
  topRated("top_rated"),
  airingToday("airing_today"),
  onTheAir("on_the_air");

  final String name;
  const SeriseList(this.name);
}

enum TrandingTimeFrame {
  day,
  week;

  String get name => toString().split(".").last;
}
