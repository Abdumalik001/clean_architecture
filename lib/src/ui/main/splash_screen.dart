import 'package:clean_architecture/src/common/resource/decorations.dart';
import 'package:clean_architecture/src/domain/models/common/app_state.dart';
import 'package:clean_architecture/src/ui/auth/login/login_screen.dart';
import 'package:clean_architecture/src/ui/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../common/assets/assets.gen.dart';
import '../../di/app_di.dart';
import 'bloc/main_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(
        locator.get(),
      )..add(
          GetAppStatus(),
        ),
      child: BlocConsumer<MainBloc, MainState>(
        builder: (context, state) {
          return Container(
            height: 52,
            decoration: const DefaultBackgroundDecoration(),
            padding: const EdgeInsets.all(100),
            child: Lottie.asset(
              Assets.lottie.loader,
              frameRate: FrameRate.max,
              width: 52,
              height: 52,
            ),
          );
        },
        listener: (context, state) {
          if (state.appState == AppState.logged) {
            // context.navigateTo(const HomeScreen(), removeStack: true);
            context.go(HomeScreen.routeName);
          }
          if (state.appState == AppState.unAuthorized) {
            context.go(LoginScreen.routeName);
          }
        },
      ),
    );
  }
}
