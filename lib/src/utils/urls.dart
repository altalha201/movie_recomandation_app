class Urls {
  static const String _baseUrl = "https://api.themoviedb.org/3";

  static String search = "$_baseUrl/search/multi";

  static String tvUrl(String catagory) => "$_baseUrl/tv/$catagory";
  static String moviUrls(String catagory) => "$_baseUrl/movie/$catagory";
  static String personUrls(String catagory) => "$_baseUrl/person/$catagory";

  static const String noPosterUrl =
      "https://ih1.redbubble.net/image.2565633904.8540/fposter,small,wall_texture,square_product,600x600.jpg";



  static String trainding(String timeWindow) =>
      "$_baseUrl/trending/all/$timeWindow";

  static String getImageUrl(String imagUrl) =>
      "https://image.tmdb.org/t/p/w500$imagUrl";
}
