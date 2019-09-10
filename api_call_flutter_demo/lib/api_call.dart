import 'dart:async';
import 'dart:convert';

import 'package:api_call_flutter_demo/api_response.dart';
import 'package:http/http.dart' as http;

String url =
    'https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=en-US';

Future<ApiResponse> getTodayWallpaper() async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return ApiResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load today\'s wallpaper');
  }
}
