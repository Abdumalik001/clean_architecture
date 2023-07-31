import 'package:animated_gradient/animated_gradient.dart';
import 'package:clean_architecture/src/common/assets/assets.gen.dart';
import 'package:clean_architecture/src/common/assets/colors.gen.dart';
import 'package:clean_architecture/src/common/utils/printer.dart';
import 'package:clean_architecture/src/common/utils/ui.dart';
import 'package:clean_architecture/src/common/widgets/button.dart';
import 'package:clean_architecture/src/common/widgets/input_widget.dart';
import 'package:clean_architecture/src/ui/auth/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../common/resource/fonts.dart';
import '../../../di/app_di.dart';
import '../../home/home_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        locator.get(),
      ),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final bloc = context.read<LoginBloc>();
          return MultiBlocListener(
            listeners: [
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.loginStatus == LoginStatus.success) {
                    // context.navigateTo(const HomeScreen(), removeStack: true);
                    context.go(HomeScreen.routeName);
                  }
                  if (state.loginStatus == LoginStatus.fail) {
                    context.showSnackBar(
                      "Strings.somethingWentWrong",
                      status: MessageStatus.fail,
                    );
                  }
                },
              ),
            ],
            child: Scaffold(
              body: AnimatedGradient(
                colors:const  [
                  ColorName.darkGreen,
                  ColorName.primaryColor,
                  ColorName.primaryColor,
                ],
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: 100,
                        child: Lottie.asset(
                          Assets.lottie.loader,
                          frameRate: FrameRate.max,
                          width: 152,
                          height: 152,
                        ),
                      ),
                      const Spacer(),
                      Input(
                          controller: bloc.usernameController,
                          hint: "username",
                          margin: const EdgeInsets.only(left: 24, right: 24)),
                      Input(
                          controller: bloc.passwordController,
                          hint: "password",
                          margin: const EdgeInsets.all(24)),
                      InkWell(
                        onTap: () {
                          context.go(RegisterScreen.routeName);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 32),
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Register ",
                            style: primaryTextStyle(
                                color: ColorName.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Spacer(),
                      Button(
                        enabled: state.loginStatus != LoginStatus.loading,
                        margin: const EdgeInsets.all(24),
                        onTap: () {
                          bloc.add(Login());
                          unFocus();
                        },
                        text: "login",
                        height: 56,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
