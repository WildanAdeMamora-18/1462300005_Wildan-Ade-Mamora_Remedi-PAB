import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class ApiService {
  Future<List<ArticleModel>> getArticles() async {

    final response = await http.get(
      Uri.parse(
        "https://api.spaceflightnewsapi.net/v4/articles/?limit=20",
      ),
    );

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      List articles =
          data['results'];

      return articles
          .map(
            (e) => ArticleModel.fromJson(e),
          )
          .toList();

    } else {
      throw Exception(
        "Failed to load articles",
      );
    }
  }
}