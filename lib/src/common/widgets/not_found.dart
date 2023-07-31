import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: 0.5,
      child: Center(
        child: Icon(Icons.error),
      ),
    );
  }
}
