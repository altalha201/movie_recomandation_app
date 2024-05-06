import 'package:connectivity_plus/connectivity_plus.dart';

class Connection {
  const Connection();

  static Future<bool> hasInternet() async {
    final conectivityResult = await Connectivity().checkConnectivity();
    if (conectivityResult.contains(ConnectivityResult.mobile) ||
        conectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }
}
