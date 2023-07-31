import 'package:clean_architecture/src/common/assets/colors.gen.dart';
import 'package:flutter/cupertino.dart';


class DefaultBackgroundDecoration extends BoxDecoration {
  final double? radius;

  @override
  BorderRadiusGeometry? get borderRadius => BorderRadius.circular(radius ?? 0);

  @override
  Color? get color => ColorName.primaryColor;

  @override
  Gradient? get gradient =>const  LinearGradient(
      colors: [
        ColorName.primaryColor,
        ColorName.primaryColorBlack,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topLeft,
      stops:  [0.0, 1],
      tileMode: TileMode.clamp);

  const DefaultBackgroundDecoration({
    this.radius,
  });
}
