import 'package:another_flushbar/flushbar.dart';
import 'package:clean_architecture/src/common/assets/colors.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../resource/fonts.dart';

void printMessage(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}

enum MessageStatus { success, fail, informative }

extension ContextExt on BuildContext {
  void showSnackBar(String? message,
      {MessageStatus status = MessageStatus.success}) {
    if (message != null) {
      Color backColor = ColorName.darkGreen;

      if (status == MessageStatus.fail) {
        backColor = Colors.red;
      }

      Flushbar(
        maxWidth: 400,
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 2),
        messageSize: 16,
        messageText: Text(
          message,
          style: primaryTextStyle(),
        ),
        backgroundColor: backColor,
        borderRadius: BorderRadius.circular(16),
        margin: const EdgeInsets.all(24),
      ).show(this);
    }
  }
}
