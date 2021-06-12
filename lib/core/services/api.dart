import 'dart:async';
import 'package:http/http.dart';
import 'package:yt_framework/core/utils/strings.dart';

class Api {
  static const uri = 'https://api.themoviedb.org/3/movie';

  static Future<Response> get(String path) async {
    try {
      final request =
          Request('GET', Uri.parse('$uri/$path?api_key=${Strings.API_KEY}'));

      final Response response = await Response.fromStream(
        await request.send().timeout(Duration(seconds: 30)),
      );

      return response;
    } catch (error) {
      throw error;
    }
  }
}
