import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/palette/palette.dart';
import '../../../../../core/style/text_style.dart';
import '../../../../../repository/articles/model/model_articles.dart';

class WidgetHorizontal {
  static List<Widget> listWidget(
    BuildContext context, {
    required List<Article> article,
  }) {
    List<Widget> data = article
        .map(
          (e) => _styleWidget(
            context,
            title: e.title ?? "",
            body: e.content ?? "",
          ),
        )
        .toList();
    return data;
  }

  static Widget _styleWidget(
    BuildContext context, {
    required String title,
    required String body,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: context.padding2),
      child: Container(
        width: context.mQWidth(0.55),
        height: context.mQWidth(0.5),
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Palette.primary),
        ),
        padding: EdgeInsets.all(context.padding1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: IText.bodyBold(color: Palette.primary),
            ),
            Expanded(
              child: Text(
                body,
                overflow: TextOverflow.clip,
                style: IText.body(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
