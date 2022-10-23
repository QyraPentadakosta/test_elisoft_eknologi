import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_elisoft_eknologi/feature/pages/module/home/services/home_services.dart';

import '../../../../../repository/articles/model/model_articles.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(const ArticlesInitial(articles: []));
  final HomeServices _homeServices = HomeServices();

  Future getArticles(BuildContext context) async {
    emit(const ArticlesLoading(articles: []));
    var resp = await _homeServices.getHome(context);
    if (resp != null) {
      emit(ArticlesLoaded(articles: resp));
    } else {
      emit(const ArticlesNotFound(articles: []));
    }
  }
}
