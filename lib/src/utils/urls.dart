import 'package:movie_recomandation_app/src/utils/secrets.dart';

class Urls {
  static const String _baseUrl = "https://api.themoviedb.org/3";

  static const String noPosterUrl = "https://ih1.redbubble.net/image.2565633904.8540/fposter,small,wall_texture,square_product,600x600.jpg";

  static String trainding(String timeWindow) => "$_baseUrl/trending/all/$timeWindow?api_key=$apiKey";

  static String search(String query) => "$_baseUrl/search/multi?api_key=$apiKey&include_adult=true&language=en-US&page=1&query=$query";

  static String getImageUrl(String imagUrl) => "https://image.tmdb.org/t/p/w500$imagUrl";
}