import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:model/model.dart';

class ApiServices {
  const ApiServices();
  static final Map<String, String> _header = {
    "Content-Type": "application/json",
  };

  static Future<ResponseModel> getRequest(
    String url, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    try {
      headers?.addAll(_header);
      final res = await http.get(
        Uri.parse(url).replace(queryParameters: params),
        headers: headers,
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
          body: json.decode(res.body),
        );
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
        statusCode: 401,
        success: false,
        body: {"message": e.toString()},
      );
    }
  }

  static Future<ResponseModel> postRequest(
    String url, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      headers?.addAll(_header);
      final res = await http.post(
        Uri.parse(url).replace(queryParameters: params),
        headers: headers,
        body: jsonEncode(body),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ResponseModel(
          statusCode: res.statusCode,
          success: true,
          body: json.decode(res.body),
        );
      } else {
        log(res.body);
        return ResponseModel(
          statusCode: res.statusCode,
          success: false,
          body: json.decode(res.body),
        );
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
        statusCode: 401,
        success: false,
        body: {"message": e.toString()},
      );
    }
  }
}
