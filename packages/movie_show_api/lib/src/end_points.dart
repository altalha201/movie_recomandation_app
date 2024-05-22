class EndPoints {
  const EndPoints();

  static const String _baseUrl = "https://movie-show-backend.onrender.com/v1";
  // static const String _baseUrl = "http://localhost:5001/v1";

  static String search = "$_baseUrl/search";

  static String tvUrl(String catagory) => "$_baseUrl/tv/$catagory";
  static String movieUrls(String catagory) => "$_baseUrl/movie/$catagory";
  static String personUrls(String catagory) => "$_baseUrl/person/$catagory";

  static const String noPosterUrl = "$_baseUrl/images/no";

  static String trainding(String timeWindow) =>
      "$_baseUrl/tranding/$timeWindow";

  static String youtubeThumnail(String videoKey) =>
      "https://img.youtube.com/vi/$videoKey/hqdefault.jpg";

  static String getImageUrl(String imagUrl) => "$_baseUrl/images$imagUrl";

  static String getProfileImage(int id) =>
      "https://avatar.iran.liara.run/public/$id";

  static String signUp = "$_baseUrl/auth/signup";
  static String login = "$_baseUrl/auth/login";

  static String profile = "$_baseUrl/user/";
  static String profileUpdate = "$_baseUrl/user/update";
  static String profileDelete = "$_baseUrl/user/delete";
}
