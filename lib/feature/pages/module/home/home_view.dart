import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_elisoft_eknologi/core/extensions/context_extensions.dart';
import 'package:test_elisoft_eknologi/feature/pages/module/home/cubit/articles_cubit.dart';
import 'package:test_elisoft_eknologi/feature/pages/module/home/cubit/user_cubit.dart';
import 'package:test_elisoft_eknologi/feature/pages/module/home/widget/card_vertical.dart';
import 'package:test_elisoft_eknologi/feature/pages/module/home/widget/home_shemmer.dart';

import '../../../../core/style/text_style.dart';
import '../../../../repository/articles/model/model_articles.dart';
import 'widget/card_horizontal.dart';

class HomeView extends StatelessWidget {
  static const routeName = "/home";

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit()..getUser(),
        ),
        BlocProvider(
          create: (context) => ArticlesCubit()..getArticles(context),
        ),
      ],
      child: const HomeViewResult(),
    );
  }
}

class HomeViewResult extends StatelessWidget {
  const HomeViewResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<ArticlesCubit, ArticlesState>(
          builder: (context, state) {
            List<Article> article = state.articles;
            if (state == const ArticlesLoading(articles: [])) {
              return homeShimmer(context);
            }
            if (state == const ArticlesNotFound(articles: [])) {
              return Center(
                child: Text(
                  "Data Not Found",
                  style: IText.body(),
                ),
              );
            }
            if (state == ArticlesLoaded(articles: article)) {
              return view(context, article: article);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget view(
    BuildContext context, {
    required List<Article> article,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding2),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Welcome, ",
                style: IText.subTitle(),
              ),
              Expanded(
                child: BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    String name = state.name;
                    if (state == const UserLoading(name: '')) {
                      return Container();
                    }
                    if (state == UserLoaded(name: name)) {
                      return Text(
                        name,
                        style: IText.subTitleBold(),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
          context.sbHeight(),
          SizedBox(
            width: context.mQWidth(1.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...WidgetHorizontal.listWidget(context, article: article),
                ],
              ),
            ),
          ),
          context.sbHeight(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ...WidgetVertical.listWidget(context, articles: article),
                  context.sbHeight(
                    size: context.iMediaQuery.padding.bottom + context.padding2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
