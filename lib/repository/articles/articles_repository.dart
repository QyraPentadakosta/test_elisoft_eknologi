import 'package:flutter/material.dart';

import '../../core/api/api.dart';
import 'model/model_articles.dart';

class ArticlesRepository extends Api {
  Future<ModelArticles?> getArticles(BuildContext context) async {
    var resp = await getNoLoading(context, path: '/articles', reqBody: {});
    if (resp != null) {
      return ModelArticles.fromJson(resp);
    }
    return null;
  }
}
