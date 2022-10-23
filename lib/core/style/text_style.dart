import 'package:flutter/material.dart';
import '../../../core/palette/palette.dart';

class IText extends TextStyle {
  const IText({
    required double fontSize,
    required FontStyle fontStyle,
    required FontWeight fontWeight,
    required Color color,
  }) : super(
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          color: color,
        );

  factory IText.titleXl({Color? color}) {
    return IText(
      fontSize: 40,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: color ?? Palette.natural,
    );
  }

  factory IText.titleBold({Color? color}) {
    return IText(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: color ?? Palette.natural,
    );
  }

  factory IText.titleSemi({Color? color}) {
    return IText(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: color ?? Palette.natural,
    );
  }

  factory IText.title({Color? color}) {
    return IText(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: color ?? Palette.natural,
    );
  }

  factory IText.subTitleBold({Color? color, FontWeight? fontWeight}) {
    return IText(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? Palette.natural,
    );
  }

  factory IText.subTitleSemi({Color? color}) {
    return IText(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: color ?? Palette.natural,
    );
  }

  factory IText.subTitle({Color? color}) {
    return IText(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: color ?? Palette.natural,
    );
  }

  factory IText.bodyBold({Color? color}) {
    return IText(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: color ?? Palette.natural,
    );
  }

  factory IText.bodySemi({Color? color}) {
    return IText(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: color ?? Palette.natural,
    );
  }

  factory IText.body({Color? color}) {
    return IText(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: color ?? Palette.natural,
    );
  }

  factory IText.captionBold({Color? color}) {
    return IText(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: color ?? Palette.natural,
    );
  }

  factory IText.captionSemi({Color? color}) {
    return IText(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: color ?? Palette.natural,
    );
  }

  factory IText.caption({Color? color, double? size}) {
    return IText(
      fontSize: size ?? 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: color ?? Palette.natural,
    );
  }
}
