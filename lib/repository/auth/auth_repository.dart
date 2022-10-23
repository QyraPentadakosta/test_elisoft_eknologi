import 'package:flutter/cupertino.dart';
import 'package:test_elisoft_eknologi/core/api/api.dart';
import 'package:test_elisoft_eknologi/repository/auth/model/model_login.dart';

class AuthRepository extends Api {
  Future<ModelLogin?> login(
    BuildContext context, {
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> param = {
      "email": username,
      "password": password,
    };
    var resp = await post(context, path: "/auth/login", reqBody: param);
    if (resp != null) {
      return ModelLogin.fromJson(resp);
    }
    return null;
  }
}
