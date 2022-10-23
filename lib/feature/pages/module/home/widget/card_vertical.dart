import 'package:flutter/cupertino.dart';
import 'package:test_elisoft_eknologi/component/img/i_image.dart';
import 'package:test_elisoft_eknologi/core/extensions/context_extensions.dart';

import '../../../../../core/palette/palette.dart';
import '../../../../../core/style/text_style.dart';
import '../../../../../repository/articles/model/model_articles.dart';
import '../../../../../utils/formater/format_date.dart';

class WidgetVertical {
  static List<Widget> listWidget(
    BuildContext context, {
    required List<Article> articles,
  }) {
    List<Widget> data = articles
        .map(
          (e) => _styleCard(
            context,
            title: e.title ?? "",
            img: e.image ?? "",
            body: e.content ?? "",
            date: FormatDate().dateToString(e.created?.date.toString() ?? ""),
          ),
        )
        .toList();
    return data;
  }

  static Widget _styleCard(
    BuildContext context, {
    required String title,
    required String img,
    required String body,
    required String date,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.padding2),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.card,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(context.padding1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IImage(
                  image: img,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 80,
                  borderRadius: BorderRadius.circular(10),
                ),
                context.sbWidth(),
                Expanded(
                  child: Text(
                    title,
                    style: IText.body(),
                  ),
                ),
              ],
            ),
            context.sbHeight(size: context.padding1),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.padding1,
              ),
              child: Text(
                body,
                maxLines: 3,
                style: IText.body(),
              ),
            ),
            context.sbHeight(),
            Text(
              date,
              style: IText.body(),
            ),
          ],
        ),
      ),
    );
  }
}
