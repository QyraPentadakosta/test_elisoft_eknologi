import 'package:flutter/material.dart';
import 'package:test_elisoft_eknologi/core/style/text_style.dart';

import '../constants/i_constants.dart';
import '../palette/palette.dart';

extension ISizeExtensions on BuildContext {
  MediaQueryData get iMediaQuery => MediaQuery.of(this);

  Size get iSize => MediaQuery.of(this).size;

  double get padding0 => IConstants.padding / 2;

  double get padding1 => IConstants.padding * 1;

  double get padding2 => IConstants.padding * 2;

  double get padding3 => IConstants.padding * 3;

  double get padding4 => IConstants.padding * 4;

  double get padding5 => IConstants.padding * 5;

  double get padding6 => IConstants.padding * 6;

  double get padding7 => IConstants.padding * 7;

  double get padding8 => IConstants.padding * 8;

  double get padding9 => IConstants.padding * 9;

  double get padding10 => IConstants.padding * 10;

  double mQWidth(double number) => iSize.width * number;

  double mQHeight(double number) => iSize.height * number;

  ///ini merupakan SizeBox dengat height. [size] defaultnya adalah [padding2]
  Widget sbHeight({double? size}) {
    return SizedBox(height: size ?? padding2);
  }

  ///ini merupakan SizeBox dengat width. [size] defaultnya adalah [padding2]
  Widget sbWidth({double? size}) {
    return SizedBox(width: size ?? padding2);
  }

  void iShowSnackBar({
    required String title,
    String subTitle = "",
    Widget? action,
    bool success = false,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(0),
        backgroundColor: success ? Palette.successMain : Palette.errorMain,
        content: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(padding2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: IText.bodyBold(color: Palette.white),
                    ),
                    subTitle.isEmpty
                        ? const SizedBox()
                        : Text(
                            subTitle,
                            style: IText.body(color: Palette.white),
                          ),
                  ],
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                ScaffoldMessenger.of(this).hideCurrentSnackBar();
              },
              child: Padding(
                padding: EdgeInsets.all(padding2),
                child: const Icon(
                  Icons.close,
                  color: Palette.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
