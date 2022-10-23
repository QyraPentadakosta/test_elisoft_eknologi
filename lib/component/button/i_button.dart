import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

import '../../core/palette/palette.dart';
import '../../core/style/text_style.dart';

class IButton {
  static Widget primary(
    BuildContext context, {
    required String title,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: context.mQWidth(1),
        decoration: BoxDecoration(
          color: onTap == null ? Palette.natural8 : Palette.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(
          vertical: context.padding2 + context.padding0,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: IText.subTitleBold(color: Palette.white),
        ),
      ),
    );
  }
}
