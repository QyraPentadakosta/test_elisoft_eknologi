import 'package:flutter/material.dart';
import '../../component/img/i_image.dart';
import '../../core/extensions/context_extensions.dart';

import 'base_api.dart';

class Api extends BaseApi {
  @override
  Future delete(String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future deleteNoLoading(String url) {
    // TODO: implement deleteNoLoading
    throw UnimplementedError();
  }

  @override
  Future put(String url, body) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future putNoLoading(String url, body) {
    // TODO: implement putNoLoading
    throw UnimplementedError();
  }

  @override
  Future showFormatException(BuildContext context) async {
    // context.iShowSnackBar(title: "Error Umum", success: false);
  }

  @override
  Future showLoading(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const Center(
            child: IImage(
              image: "assets/lottie/loading.json",
              width: 200,
            ),
          ),
        );
      },
    );
  }

  @override
  Future showRequestTimeOut(BuildContext context, int timeout) {
    // TODO: implement showRequestTimeOut
    throw UnimplementedError();
  }

  @override
  Future showErrorDialog(
    BuildContext context,
    int statusCode, {
    String? message,
  }) async {
    context.iShowSnackBar(
      title: "$statusCode",
      subTitle: message ?? "",
      success: false,
    );
  }
}
