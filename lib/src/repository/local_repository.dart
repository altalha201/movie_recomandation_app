import 'package:get_storage/get_storage.dart';

class LocalRepository {
  const LocalRepository();

  static void writeToken(String token) {
    final box = GetStorage("movie_show_loval_storage");
    box.write("ms_auth_key", token);
  }

  static String? getToken() {
    final box = GetStorage("movie_show_loval_storage");

    return box.read('ms_auth_key');
  }

  static void ereas() {
    final box = GetStorage("movie_show_loval_storage");
    box.erase();
  }
}
