import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../component/img/i_image.dart';
import '../../../../component/text_field/i_text_field.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../component/button/i_button.dart';
import '../../../../core/palette/palette.dart';
import '../../../../core/style/text_style.dart';
import 'cubit/hide_show_password_cubit.dart';
import 'cubit/validator_login_cubit.dart';
import 'login_cubit.dart';

class LoginView extends StatelessWidget {
  static const routeName = "/login";

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => ValidatorLoginCubit()
            ..validator(
              username: context.read<LoginCubit>().usernameController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
        ),
        BlocProvider(
          create: (context) => HideShowPasswordCubit(),
        ),
      ],
      child: const LoginViewResult(),
    );
  }
}

class LoginViewResult extends StatelessWidget {
  const LoginViewResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: SafeArea(
        child: Container(
          width: context.mQWidth(1),
          height: context.mQHeight(1),
          padding: EdgeInsets.symmetric(horizontal: context.padding2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'My APPS',
                  style: IText.titleXl(color: Palette.primary),
                ),
                context.sbHeight(),
                IImage(
                  image: "assets/lottie/login.json",
                  width: context.mQWidth(0.6),
                ),
                context.sbHeight(size: context.padding10),
                ITextField.primary(
                  context,
                  controller: context.read<LoginCubit>().usernameController,
                  label: "Username",
                  onChanged: (p0) {
                    context.read<LoginCubit>().validatorForm();
                  },
                ),
                context.sbHeight(),
                BlocBuilder<HideShowPasswordCubit, bool>(
                  builder: (context, state) {
                    return ITextField.password(
                      context,
                      controller: context.read<LoginCubit>().passwordController,
                      label: "Password",
                      obscureText: state,
                      hideShowPassword: () {
                        context
                            .read<HideShowPasswordCubit>()
                            .hideShowPassword();
                      },
                      onChanged: (p0) {
                        context.read<ValidatorLoginCubit>().validator(
                              username: context
                                  .read<LoginCubit>()
                                  .usernameController
                                  .text,
                              password: context
                                  .read<LoginCubit>()
                                  .passwordController
                                  .text,
                            );
                      },
                    );
                  },
                ),
                context.sbHeight(size: context.padding6),
                BlocBuilder<ValidatorLoginCubit, bool>(
                  builder: (context, state) {
                    return IButton.primary(
                      context,
                      title: "LOGIN",
                      onTap: state
                          ? () {
                              context.read<LoginCubit>().login(context);
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
