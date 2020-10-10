import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ui_test/news/providers/articles.dart';
import 'package:http/http.dart' as http;

class News with ChangeNotifier {
  List<Articles> _newsArticles = [];

  List<Articles> get newsArticles => _newsArticles;

  //news fetch from remote
  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=aa67d8d98c8e4ad1b4f16dbd5f3be348";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    print(jsonData);
    if (jsonData['status'] == "ok") {
      _newsArticles = (jsonData['articles'] as List)
          .map((i) => Articles.fromJson(i))
          .toList();

    }
  }
}
