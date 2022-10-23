import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_cubit.dart';

class SplashView extends StatelessWidget {
  static const routeName = "/";

  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..goToLogin(context),
      child: view(context),
    );
  }

  Widget view(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text("SplashView"),
          ),
        );
      },
    );
  }
}
