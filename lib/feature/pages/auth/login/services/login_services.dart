import 'package:flutter/cupertino.dart';
import 'package:test_elisoft_eknologi/repository/auth/auth_repository.dart';
import 'package:test_elisoft_eknologi/repository/auth/model/model_login.dart';

class LoginServices {
  final AuthRepository _authRepository = AuthRepository();

  Future<ModelLogin?> login(BuildContext context,
      {required String username, required String password}) async {
    var resp = await _authRepository.login(
      context,
      username: username,
      password: password,
    );
    if (resp != null) {
      return resp;
    }
    return null;
  }
}
