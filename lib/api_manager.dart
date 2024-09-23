import 'dart:convert';

import 'package:http/http.dart' as http;

import 'end_points.dart';
import 'movieName.dart';

class ApiManager {
  static const String baseUrl = 'api.themoviedb.org';
  static const String apiKey = '34e003d4b9d026a15d3cc1a2ce2c3fd2';
  static const String language = 'en-US';
  static const String page = '1';

  static Future<MovieName> getMovieName(int movieId) async {
    Uri url = Uri.https(
      baseUrl,
      '${EndPoints.details}/$movieId/similar',
      {
        'api_key': apiKey,
        'language': language,
        'page': page,
      },
    );
    try {
      var response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var bodyString = response.body;
        var json = jsonDecode(bodyString);
        return MovieName.fromJson(json);
      } else {
        throw Exception(
            'Failed to load similar movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching similar movies: $e');
    }
  }
}
