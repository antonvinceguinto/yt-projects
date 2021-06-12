import 'dart:async';
import 'package:http/http.dart';

class Api {
  static const uri = 'https://pokeapi.co/api/v2';

  static Future<Response> get(
    String path, {
    Map<String, dynamic> body,
  }) async {
    try {
      final request = Request('GET', Uri.parse('$uri/$path'));

      final Response response = await Response.fromStream(
        await request.send().timeout(Duration(seconds: 30)),
      );

      return response;
    } catch (error) {
      throw error;
    }
  }
}
