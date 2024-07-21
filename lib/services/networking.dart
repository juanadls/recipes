import 'package:dio/dio.dart';

import '../data/models/recipe.dart';

class Networking {
  Networking() {
    _client = Dio();
  }

  late final Dio _client;

  Future<List<Recipe>> getRecipes() async {
    const String baseUrl = 'https://api.edamam.com/api/recipes/v2';
    const String apiKey = '1740dd117fe23d41d8d372cf4b3d3c33';
    const String apiId = '3c0b0cac';
    final Map<String, dynamic> queryParams = {
      'type': 'public',
      'q': 'banana',
      'app_id': apiId,
      'app_key': apiKey,
    };

    try {
      final response = await _client.get(
        baseUrl,
        queryParameters: queryParams,
        options: Options(
          receiveTimeout: const Duration(seconds: 5),
          headers: {},
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> hits = response.data['hits'];
        List<Recipe> recipes =
            hits.map((hit) => Recipe.fromJson(hit['recipe'])).toList();
        return recipes;
      } else {
        throw Exception("Error: ${response.statusMessage}");
      }
    } catch (error) {
      throw Exception("Error calling service: $error");
    }
  }
}
