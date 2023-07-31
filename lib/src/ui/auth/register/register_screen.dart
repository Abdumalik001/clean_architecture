import 'package:animated_gradient/animated_gradient.dart';
import 'package:clean_architecture/src/common/assets/colors.gen.dart';
import 'package:clean_architecture/src/common/utils/printer.dart';
import 'package:clean_architecture/src/common/utils/ui.dart';
import 'package:clean_architecture/src/common/widgets/button.dart';
import 'package:clean_architecture/src/common/widgets/input_widget.dart';
import 'package:clean_architecture/src/ui/auth/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../common/assets/assets.gen.dart';
import '../../../di/app_di.dart';
import '../../home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/registerScreen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) {
        print('back');
      },
      child: BlocProvider(
        create: (_) => RegisterBloc(
          locator.get(),
        ),
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final bloc = context.read<RegisterBloc>();
            return MultiBlocListener(
              listeners: [
                BlocListener<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state.registerStatus == RegisterStatus.success) {
                      // context.navigateTo(const HomeScreen(), removeStack: true);
                      context.go(HomeScreen.routeName);
                    }
                    if (state.registerStatus == RegisterStatus.fail) {
                      context.showSnackBar(
                        "Strings.somethingWentWrong",
                        status: MessageStatus.fail,
                      );
                    }
                  },
                ),
              ],
              child: Material(
                child: AnimatedGradient(
                  colors: const [
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
                        const Spacer(),
                        const Spacer(),
                        Button(
                          enabled:
                              state.registerStatus != RegisterStatus.loading,
                          margin: const EdgeInsets.all(24),
                          onTap: () {
                            bloc.add(Register());
                            unFocus();
                          },
                          text: "register",
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
