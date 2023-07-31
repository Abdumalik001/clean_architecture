import 'package:clean_architecture/src/common/assets/colors.gen.dart';
import 'package:clean_architecture/src/common/resource/fonts.dart';
import 'package:flutter/material.dart';


class Input extends StatelessWidget {
  final String hint;
  final EdgeInsets margin;
  bool multiLine = false;
  final FocusNode? focusNode;
  double verticalPadding = 0.0;
  double blur;
  double spread;
  final int? maxLength;
  final TextEditingController? controller;
  final Function(String)? onSubmit;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: ColorName.primaryDark,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: blur,
            spreadRadius: spread,
            offset: const Offset(0, 0), // shadow direction: bottom right
          )
        ],
      ),
      margin: margin,
      child: TextField(
        maxLength: maxLength,
        style: primaryTextStyle(),
        cursorColor: ColorName.white,
        onSubmitted: (str) {
          onSubmit?.call(str);
        },
        onChanged: (text) {
          onChange?.call(text);
        },
        focusNode: focusNode,
        keyboardType: multiLine ? TextInputType.multiline : TextInputType.name,
        maxLines: multiLine ? null : 1,
        textAlign: TextAlign.start,
        controller: controller,
        decoration: InputDecoration(
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
                color: ColorName.darkSpringGreen.withAlpha(180), width: 2),
          ),
          hintText: hint,
          hintStyle: primaryTextStyle(color: Colors.white.withAlpha(52)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.only(
              left: 20,
              bottom: verticalPadding,
              top: verticalPadding,
              right: 20),
          fillColor: ColorName.primaryColor,
        ),
      ),
    );
  }

  Input({
    super.key,
    required this.hint,
    this.multiLine = false,
    this.verticalPadding = 20,
    this.focusNode,
    this.controller,
    this.blur = 200.0,
    this.onSubmit,
    this.onChange,
    this.maxLength,
    this.spread = 12.0,
    required this.margin,
  });
}
