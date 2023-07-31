import 'package:clean_architecture/src/common/assets/colors.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


void unFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void setNavColor() {
  var mySystemTheme = SystemUiOverlayStyle.light
      .copyWith(systemNavigationBarColor: ColorName.black);
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
}
