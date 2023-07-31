import 'package:clean_architecture/src/common/language/language.dart';
import 'package:clean_architecture/src/di/app_di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ui/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await setUpDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: Language.supportedLanguages,
      path: Language.languagePath,
      saveLocale: true,
      startLocale: Language.defaultLanguage,
      child: const MainScreen(),
    ),
  );
}

