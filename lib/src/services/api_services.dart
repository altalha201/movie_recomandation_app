import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/response_model.dart';

class ApiServices {

  static Future<ResponseModel> getRequest(String url) async {
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        return ResponseModel(
          statusCode: 200,
          success: true,
          body: json.decode(res.body),
        );
      } else {
        return ResponseModel(statusCode: res.statusCode, success: false,);
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
        statusCode: 401,
        success: false,
      );
    }
  }
}
