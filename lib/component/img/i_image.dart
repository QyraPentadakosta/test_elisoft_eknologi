import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IImage extends StatelessWidget {
  final dynamic image;
  final double? height, width;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final Color? loadingColor;

  const IImage(
      {Key? key,
      required this.image,
      this.height,
      this.width,
      this.loadingColor,
      this.fit = BoxFit.cover,
      this.borderRadius = BorderRadius.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image is String) {
      var image = this.image as String;
      if (image.isNotEmpty) {
        if (image.startsWith("http")) {
          return ClipRRect(
            borderRadius: borderRadius,
            child: CachedNetworkImage(
              imageUrl: image,
              width: width,
              height: height,
              fit: fit,
              placeholder: (context, url) {
                return Center(
                  child: CircularProgressIndicator(
                    color: loadingColor,
                  ),
                );
              },
              errorWidget: (context, _, x) {
                return const Icon(Icons.image_not_supported);
              },
            ),
          );
        } else if (image.startsWith("assets")) {
          if (image.endsWith(".json")) {
            return LottieBuilder.asset(
              image,
              height: height,
              width: width,
            );
          }
          return ClipRRect(
            borderRadius: borderRadius,
            child: Image.asset(
              image,
              height: height,
              width: width,
              fit: fit,
            ),
          );
        }
      }
    }
    if (image is File) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: Image.file(
          image,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    }
    return Icon(
      Icons.image_not_supported_outlined,
      size: width,
      color: Colors.black,
    );
  }
}
