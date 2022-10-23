import 'package:flutter/material.dart';
import 'package:test_elisoft_eknologi/core/palette/palette.dart';
import '../../../../../core/extensions/context_extensions.dart';

import '../../../../../component/shimmer/i_shimmer.dart';

Widget homeShimmer(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.padding2),
    child: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IShimmer.shimmer(
            context,
            height: 25,
            width: context.mQWidth(0.4),
          ),
          context.sbHeight(size: context.padding4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IShimmer.shimmer(
                      context,
                      height: 20,
                      width: context.mQWidth(0.3),
                      radius: 5,
                    ),
                    context.sbHeight(size: context.padding1),
                    IShimmer.shimmer(
                      context,
                      height: context.mQHeight(0.22),
                      width: context.mQWidth(0.6),
                    ),
                  ],
                ),
                context.sbWidth(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IShimmer.shimmer(
                      context,
                      height: 20,
                      width: context.mQWidth(0.3),
                      radius: 5,
                    ),
                    context.sbHeight(size: context.padding1),
                    IShimmer.shimmer(
                      context,
                      height: context.mQHeight(0.22),
                      width: context.mQWidth(0.6),
                    ),
                  ],
                ),
                context.sbWidth(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IShimmer.shimmer(
                      context,
                      height: 20,
                      width: context.mQWidth(0.3),
                      radius: 5,
                    ),
                    context.sbHeight(size: context.padding1),
                    IShimmer.shimmer(
                      context,
                      height: context.mQHeight(0.22),
                      width: context.mQWidth(0.6),
                    ),
                  ],
                ),
              ],
            ),
          ),
          context.sbHeight(),
          Container(
            width: context.mQWidth(1.0),
            decoration: BoxDecoration(
              color: Palette.natural9,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.padding2,
              vertical: context.padding2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IShimmer.shimmer(
                      context,
                      height: context.mQHeight(0.1),
                      width: context.mQWidth(0.25),
                      radius: 5,
                    ),
                    context.sbWidth(),
                    Expanded(
                      child: IShimmer.shimmer(
                        context,
                        height: 40,
                        width: 0,
                        radius: 5,
                      ),
                    ),
                  ],
                ),
                context.sbHeight(),
                IShimmer.shimmer(
                  context,
                  height: 50,
                  width: context.mQWidth(1.0),
                ),
                context.sbHeight(),
                IShimmer.shimmer(
                  context,
                  height: 20,
                  width: context.mQWidth(0.5),
                ),
              ],
            ),
          ),
          context.sbHeight(),
          Container(
            width: context.mQWidth(1.0),
            decoration: BoxDecoration(
              color: Palette.natural9,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.padding2,
              vertical: context.padding2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IShimmer.shimmer(
                      context,
                      height: context.mQHeight(0.1),
                      width: context.mQWidth(0.25),
                      radius: 5,
                    ),
                    context.sbWidth(),
                    Expanded(
                      child: IShimmer.shimmer(
                        context,
                        height: 40,
                        width: 0,
                        radius: 5,
                      ),
                    ),
                  ],
                ),
                context.sbHeight(),
                IShimmer.shimmer(
                  context,
                  height: 50,
                  width: context.mQWidth(1.0),
                ),
                context.sbHeight(),
                IShimmer.shimmer(
                  context,
                  height: 20,
                  width: context.mQWidth(0.5),
                ),
              ],
            ),
          ),
          context.sbHeight(),
          Container(
            width: context.mQWidth(1.0),
            decoration: BoxDecoration(
              color: Palette.natural9,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.padding2,
              vertical: context.padding2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IShimmer.shimmer(
                      context,
                      height: context.mQHeight(0.1),
                      width: context.mQWidth(0.25),
                      radius: 5,
                    ),
                    context.sbWidth(),
                    Expanded(
                      child: IShimmer.shimmer(
                        context,
                        height: 40,
                        width: 0,
                        radius: 5,
                      ),
                    ),
                  ],
                ),
                context.sbHeight(),
                IShimmer.shimmer(
                  context,
                  height: 50,
                  width: context.mQWidth(1.0),
                ),
                context.sbHeight(),
                IShimmer.shimmer(
                  context,
                  height: 20,
                  width: context.mQWidth(0.5),
                ),
              ],
            ),
          ),
          context.sbHeight(),
          Container(
            width: context.mQWidth(1.0),
            decoration: BoxDecoration(
              color: Palette.natural9,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.padding2,
              vertical: context.padding2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IShimmer.shimmer(
                      context,
                      height: context.mQHeight(0.1),
                      width: context.mQWidth(0.25),
                      radius: 5,
                    ),
                    context.sbWidth(),
                    Expanded(
                      child: IShimmer.shimmer(
                        context,
                        height: 40,
                        width: 0,
                        radius: 5,
                      ),
                    ),
                  ],
                ),
                context.sbHeight(),
                IShimmer.shimmer(
                  context,
                  height: 50,
                  width: context.mQWidth(1.0),
                ),
                context.sbHeight(),
                IShimmer.shimmer(
                  context,
                  height: 20,
                  width: context.mQWidth(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
