import 'package:flutter/material.dart';
import 'package:test_elisoft_eknologi/feature/pages/auth/login/login_view.dart';
import 'package:test_elisoft_eknologi/feature/pages/error/error_view.dart';
import 'package:test_elisoft_eknologi/feature/pages/splash/splash_view.dart';

import '../feature/pages/module/home/home_view.dart';

const initialRoute = SplashView.routeName;

Route<dynamic>? routes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
        settings: settings,
      );
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
        settings: settings,
      );
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeView(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const ErrorView(),
        settings: settings,
      );
  }
}
