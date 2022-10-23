import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/palette/palette.dart';

class IShimmer {
  static Widget shimmer(
    BuildContext context, {
    required double height,
    required double width,
    double? radius,
  }) {
    return Shimmer.fromColors(
      baseColor: Palette.natural9,
      highlightColor: Palette.natural8,
      period: const Duration(seconds: 5),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Palette.natural,
          borderRadius: BorderRadius.circular(radius ?? 5),
        ),
      ),
    );
  }
}
