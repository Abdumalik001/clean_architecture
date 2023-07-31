import 'package:clean_architecture/src/common/assets/colors.gen.dart';
import 'package:clean_architecture/src/common/resource/fonts.dart';
import 'package:clean_architecture/src/common/widgets/scale_tap.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String text;
  final bool? enabled;
  final bool? animate;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled == false ? 0.5 : 1,
      child: ScaleTap(
        scaleMinValue: enabled == false ? 1 : null,
        enableFeedback: enabled == true,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          margin: margin,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorName.darkGreen),
          child: enabled == true
              ? animate == true
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: ColorName.darkSpringGreen,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      text,
                      style: primaryTextStyle(
                          color: ColorName.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
              : Text(
                  text,
                  style: primaryTextStyle(
                      color: ColorName.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
        ),
        onPressed: () {
          if (enabled == true) {
            onTap.call();
          }
        },
      ),
    );
  }

  const Button({
    super.key,
    this.margin,
    this.width,
    this.enabled = true,
    this.animate = false,
    required this.onTap,
    this.height,
    required this.text,
  });
}
