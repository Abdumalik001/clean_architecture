import 'package:clean_architecture/src/common/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../common/utils/ui.dart';
import '../../di/app_di.dart';
import 'bloc/main_bloc.dart';
import 'splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    setNavColor();
    // FirebaseMessaging.instance.getToken().then((value) {
    //   printMessage("Current token : ${value}");
    // });
    return BlocProvider<MainBloc>(
      create: (_) => MainBloc(locator.get())
        ..add(
          ObserveAppState(),
        ),
      child: OverlaySupport.global(
        child: MaterialApp.router(
          // navigatorKey: navigatorKey,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,
          // home: BlocBuilder<MainBloc, MainState>(
          //   builder: (BuildContext context, state) {
          //     return const SplashScreen();
          //   },
          // ),
          routerConfig: AppRouter.router(),
        ),
      ),
    );
  }
}
