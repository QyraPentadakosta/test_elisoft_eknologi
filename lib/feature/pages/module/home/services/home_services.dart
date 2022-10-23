import 'package:flutter/material.dart';
import 'package:test_elisoft_eknologi/repository/articles/articles_repository.dart';
import 'package:test_elisoft_eknologi/repository/articles/model/model_articles.dart';

class HomeServices {
  final ArticlesRepository _homeRepository = ArticlesRepository();

  Future<List<Article>?> getHome(BuildContext context) async {
    var resp = await _homeRepository.getArticles(context);
    if (resp != null) {
      return resp.articles;
    }
    return null;
  }
}
