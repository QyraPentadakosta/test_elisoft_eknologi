import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_elisoft_eknologi/core/constants/i_constants.dart';
import 'package:test_elisoft_eknologi/routes/routes_function.dart';

import '../../module/home/home_view.dart';
import 'services/login_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginServices _loginServices = LoginServices();

  TextEditingController usernameController = TextEditingController();

  // TextEditingController(text: "rachman.latif@gmail.com");
  TextEditingController passwordController = TextEditingController();

  // TextEditingController(text: "testing");

  bool isFormValid = false;

  bool get mounted => true;

  Future login(BuildContext context) async {
    var resp = await _loginServices.login(
      context,
      username: usernameController.text,
      password: passwordController.text,
    );
    if (resp?.code == 200) {
      await IConstants().setString(IConstants.name, resp?.user?.name);
      if (mounted) {
        goToNamed(
          context,
          routeName: HomeView.routeName,
          routeType: RouteType.pushRemove,
        );
      }
    }
  }

  void validatorForm() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      emit(const LoginValidator(true));
      isFormValid = true;
    } else {
      isFormValid = false;
      emit(const LoginValidator(false));
    }
  }
}
