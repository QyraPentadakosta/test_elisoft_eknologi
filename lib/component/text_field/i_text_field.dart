import 'package:flutter/material.dart';
import 'package:test_elisoft_eknologi/core/extensions/context_extensions.dart';
import 'package:test_elisoft_eknologi/core/style/text_style.dart';

import '../../core/palette/palette.dart';

class ITextField {
  static Widget primary(
    BuildContext context, {
    TextEditingController? controller,
    required String label,
    TextInputType? inputType,
    void Function(String)? onChanged,
    TextInputAction? textInputAction,
    int? maxLength,
    String? hint,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: context.padding1, vertical: context.padding1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: IText.captionSemi(color: Palette.primary),
          ),
          context.sbHeight(size: context.padding1),
          TextField(
            style: IText.caption(color: Palette.natural, size: 14),
            controller: controller,
            keyboardType: inputType,
            onChanged: onChanged,
            textInputAction: textInputAction,
            maxLength: maxLength,
            decoration: const InputDecoration(
              focusColor: Palette.primary,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              constraints: BoxConstraints(maxHeight: 20),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  static Widget password(
    BuildContext context, {
    TextEditingController? controller,
    required String label,
    TextInputType? inputType,
    void Function(String)? onChanged,
    void Function()? hideShowPassword,
    TextInputAction? textInputAction,
    int? maxLength,
    String? hint,
    required bool obscureText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: context.padding1, vertical: context.padding1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: IText.captionSemi(color: Palette.primary),
                ),
                context.sbHeight(size: context.padding1),
                TextField(
                  style: IText.caption(color: Palette.natural, size: 14),
                  controller: controller,
                  keyboardType: inputType,
                  onChanged: onChanged,
                  textInputAction: textInputAction,
                  maxLength: maxLength,
                  obscureText: obscureText,
                  obscuringCharacter: '*',
                  decoration: const InputDecoration(
                    focusColor: Palette.primary,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    constraints: BoxConstraints(maxHeight: 20),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
              onTap: hideShowPassword,
              child: obscureText
                  ? const Icon(
                      Icons.remove_red_eye,
                      color: Palette.primary,
                    )
                  : const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Palette.primary,
                    )),
          context.sbWidth(size: context.padding0),
        ],
      ),
    );
  }
}
