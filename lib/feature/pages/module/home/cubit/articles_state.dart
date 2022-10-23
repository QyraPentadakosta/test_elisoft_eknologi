part of 'articles_cubit.dart';

abstract class ArticlesState extends Equatable {
  final List<Article> articles;

  const ArticlesState({required this.articles});

  @override
  List<Object> get props => [articles];
}

class ArticlesInitial extends ArticlesState {
  const ArticlesInitial({required List<Article> articles})
      : super(articles: articles);
}

class ArticlesLoading extends ArticlesState {
  const ArticlesLoading({required List<Article> articles})
      : super(articles: articles);
}

class ArticlesLoaded extends ArticlesState {
  const ArticlesLoaded({required List<Article> articles})
      : super(articles: articles);
}

class ArticlesNotFound extends ArticlesState {
  const ArticlesNotFound({required List<Article> articles})
      : super(articles: articles);
}
