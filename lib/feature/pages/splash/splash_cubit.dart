import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_elisoft_eknologi/feature/pages/auth/login/login_view.dart';
import 'package:test_elisoft_eknologi/routes/routes_function.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  bool get mounted => true;

  Future goToLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      goToNamed(context, routeName: LoginView.routeName);
    }
  }
}
