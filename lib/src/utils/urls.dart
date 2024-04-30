class Urls {
  static const String _baseUrl = "https://movie-show-backend.onrender.com/v1";

  static String search = "$_baseUrl/search";

  static String tvUrl(String catagory) => "$_baseUrl/tv/$catagory";
  static String moviUrls(String catagory) => "$_baseUrl/movie/$catagory";
  static String personUrls(String catagory) => "$_baseUrl/person/$catagory";

  static const String noPosterUrl = "$_baseUrl/images/no";

  static String trainding(String timeWindow) =>
      "$_baseUrl/tranding/$timeWindow";

  static String getImageUrl(String imagUrl) => "$_baseUrl/images$imagUrl";
}
