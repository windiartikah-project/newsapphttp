import 'dart:convert';
import 'package:news_app/models/news.dart';
import 'package:http/http.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=3a7bb0236010448e964d387a73a2e0bd";

  Future<List<News>> getNews() async {
    final response = await get(Uri.tryParse(endPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<News> news = body.map((item) => News.fromJson(item)).toList();

      return news;
    } else {
      throw Exception("Can't get the News!");
    }
  }
}
