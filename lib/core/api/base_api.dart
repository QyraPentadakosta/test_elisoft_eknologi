import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_elisoft_eknologi/core/api/env.dart';
import 'package:http/http.dart' as ihttp;

enum Method {
  get,
  post,
  put,
  delete,
}

abstract class BaseApi {
  final Method _post = Method.post;
  final Method _get = Method.get;
  final Method _put = Method.put;
  final Method _delete = Method.delete;
  final int _timeout = 60;

  bool get mounted => true;

  Future<dynamic> get(
    BuildContext context, {
    required String path,
    required Map<String, dynamic> reqBody,
  }) async {
    return await _featchApi(
      context,
      path: path,
      reqBody: reqBody,
      isShowLoading: true,
      method: _get,
      baseUrl: Env.apiUrl,
      header: Env.header,
      timeOut: _timeout,
    );
  }

  Future<dynamic> getNoLoading(
    BuildContext context, {
    required String path,
    required Map<String, dynamic> reqBody,
  }) async {
    return await _featchApi(
      context,
      path: path,
      reqBody: reqBody,
      isShowLoading: false,
      method: _get,
      baseUrl: Env.apiUrl,
      header: Env.header,
      timeOut: _timeout,
    );
  }

  Future<dynamic> post(
    BuildContext context, {
    required String path,
    required Map<String, dynamic> reqBody,
  }) async {
    return await _featchApi(
      context,
      path: path,
      reqBody: reqBody,
      isShowLoading: true,
      method: _post,
      baseUrl: Env.apiUrl,
      header: Env.header,
      timeOut: _timeout,
    );
  }

  Future<dynamic> postNoLoading(
    BuildContext context, {
    required String path,
    required Map<String, dynamic> reqBody,
  }) async {
    return await _featchApi(
      context,
      path: path,
      reqBody: reqBody,
      isShowLoading: false,
      method: _post,
      baseUrl: Env.apiUrl,
      header: Env.header,
      timeOut: _timeout,
    );
  }

  Future<dynamic> put(String url, dynamic body);

  Future<dynamic> putNoLoading(String url, dynamic body);

  Future<dynamic> delete(String url);

  Future<dynamic> deleteNoLoading(String url);

  Future<dynamic> _featchApi(
    BuildContext context, {
    required String baseUrl,
    required String path,
    required Method method,
    required bool isShowLoading,
    required int timeOut,
    required Map<String, String> header,
    required Map<String, dynamic> reqBody,
  }) async {
    bool error = false;
    ihttp.Response response;
    var strLog = "";
    if (isShowLoading) {
      showLoading(context);
    }
    final String url = baseUrl + path;
    strLog += "[$method] $url";
    strLog += "\t\n[Request Headers] : \n\t$header";
    var param = json.encode(reqBody);
    strLog += "\t\n[Request Body] : \n\t$reqBody";
    if (kDebugMode) {
      log("\n:: PROCESSING ::\n$strLog");
    }
    var start = DateTime.now().millisecondsSinceEpoch;

    try {
      if (method == Method.post) {
        response = await ihttp
            .post(
              Uri.parse(url),
              headers: Env.header,
              body: param,
            )
            .timeout(
              Duration(seconds: timeOut),
            );
      } else {
        response = await ihttp
            .get(
              Uri.parse(url),
              headers: Env.header,
            )
            .timeout(Duration(seconds: timeOut));
      }
      strLog += "\t\n[Response Code] : \n\t${response.statusCode}";
      strLog += "\t\n[Response Headers] : \n\t${response.headers.toString()}";
      strLog += "\t\n[Response Body Raw] : \n\t${response.body.toString()}";
      if (response.statusCode == 200) {
        // ignore: unnecessary_null_comparison
        if (response.body != null) {
          // if (isShowLoading) Navigator.pop(context);
          var respDecode = json.decode(response.body);
          return respDecode;
        } else {
          error = true;
          if (isShowLoading) {
            if (mounted) {
              Navigator.pop(context);
            }
          }
          // var respDecode = json.decode(response.body);
          return null;
        }
      } else if (response.statusCode == 400) {
        error = true;
        if (isShowLoading) {
          if (mounted) {
            Navigator.pop(context);
          }
        }
        var respDecode = json.decode(response.body);
        if (mounted) {
          showErrorDialog(
            context,
            response.statusCode,
            message: respDecode['message'],
          );
        }
        return null;
      } else {
        error = true;
        if (isShowLoading) {
          if (mounted) {
            Navigator.pop(context);
          }
        }
        var respDecode = json.decode(response.body);
        if (mounted) {
          showErrorDialog(
            context,
            response.statusCode,
            message: respDecode['message'],
          );
        }
        return null;
      }
    } on FormatException catch (_) {
      error = true;
      if (isShowLoading) Navigator.pop(context);
      showFormatException(context);
    } on TimeoutException catch (_) {
      error = true;
      if (isShowLoading) Navigator.pop(context);
      showRequestTimeOut(context, _timeout);
      strLog += ("\n:: PROCESS TIME OUT! ::");
    } catch (_) {
      showFormatException(context);
    } finally {
      if (!error && isShowLoading) Navigator.pop(context);
      var end = DateTime.now().millisecondsSinceEpoch;
      strLog += "\n--> ${end - start}ms";
      if (kDebugMode) {
        log("\n:: FINALLY ::\n$strLog");
      }
    }
  }

  Future showLoading(BuildContext context);

  Future showErrorDialog(
    BuildContext context,
    int statusCode, {
    String? message,
  });

  Future showRequestTimeOut(BuildContext context, int timeout);

  Future showFormatException(BuildContext context);
}
