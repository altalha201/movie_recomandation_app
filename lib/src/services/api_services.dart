import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/response_model.dart';
import '../utils/secrets.dart';

class ApiServices {
  static final Map<String, String> _header = {
    "accept": "application/json",
  };

  static final Map<String, dynamic> _perams = {"api_key": apiKey};

  static Future<ResponseModel> getRequest(
    String url, {
    Map<String, dynamic>? params,
  }) async {
    try {
      if (params != null) {
        _perams.addAll(params);
      }
      log(Uri.parse(url).replace(queryParameters: _perams).toString());
      final res = await http.get(
        Uri.parse(url).replace(queryParameters: _perams),
        headers: _header,
      );
      if (res.statusCode == 200) {
        // log(json.decode(res.body));
        return ResponseModel(
          statusCode: 200,
          success: true,
          body: json.decode(res.body),
        );
      } else {
        return ResponseModel(
          statusCode: res.statusCode,
          success: false,
        );
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
