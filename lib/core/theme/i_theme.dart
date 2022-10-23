import 'package:flutter/material.dart';
import 'package:test_elisoft_eknologi/core/style/text_style.dart';

import '../palette/palette.dart';

class ITheme {
  ThemeData createTheme() {
    return ThemeData(
      disabledColor: Colors.grey,
      colorScheme: const ColorScheme(
        primary: Palette.primary,
        surface: Palette.infoMain,
        background: Colors.white,
        error: Palette.errorMain,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Palette.natural,
        onBackground: Palette.natural9,
        onError: Palette.errorMain,
        brightness: Brightness.light,
        secondary: Palette.secondary,
      ),
      brightness: Brightness.light,
      primaryColor: Palette.primary,
      splashColor: Palette.primary,
      scaffoldBackgroundColor: Palette.white,
      dividerTheme: const DividerThemeData(thickness: 1),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Palette.white,
        titleTextStyle: IText.title(),
        iconTheme: const IconThemeData(
          color: Palette.natural,
          size: 27,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                fixedSize: const Size(double.infinity, 52))
            .copyWith(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.disabled)
                      ? Palette.natural4
                      : Palette.primary,
                ),
                textStyle:
                    MaterialStateProperty.all(IText.title(color: Colors.red))),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          fixedSize: const Size(double.infinity, 52),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.disabled)
                ? Colors.grey
                : Palette.primary,
          ),
          side: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.disabled)
                ? const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  )
                : const BorderSide(
                    color: Palette.primary,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
          ),
          backgroundColor: MaterialStateProperty.all(Palette.natural9),
        ),
      ),
    );
  }
}
