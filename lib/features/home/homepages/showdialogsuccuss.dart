import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Showdialogsuccuss {
  static show({
    required BuildContext context,
    required String lottie,
    required String text,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(lottie, width: 120, height: 120),
              Text(text),
            ],
          ),
        );
      },
    );
  }
}
