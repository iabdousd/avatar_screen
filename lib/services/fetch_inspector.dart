import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class FetchInspector {
  static Future<http.Response> get(String url) async {
    final res = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: 'test_token',
      },
    );
    return http.Response(
      utf8.decode(res.bodyBytes),
      res.statusCode,
      headers: res.headers,
    );
  }

  static Future<http.Response> put(String url, String body) async {
    final res = await http.put(
      Uri.parse(url),
      body: body,
      headers: {
        HttpHeaders.authorizationHeader: 'test_token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    return http.Response(
      utf8.decode(res.bodyBytes),
      res.statusCode,
      headers: res.headers,
    );
  }
}
