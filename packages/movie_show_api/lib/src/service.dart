import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:model/model.dart';

class ApiServices {
  const ApiServices();
  static final Map<String, String> _header = {
    "accept": "application/json",
  };

  static Future<ResponseModel> getRequest(
    String url, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final res = await http.get(
        Uri.parse(url).replace(queryParameters: params),
        headers: _header,
      );
      if (res.statusCode == 200) {
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

  static Future<ResponseModel> postRequest(
    String url, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
  }) async {
    try {
      final res = await http.post(
        Uri.parse(url).replace(queryParameters: params),
        headers: _header,
        body: body,
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ResponseModel(
          statusCode: res.statusCode,
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
