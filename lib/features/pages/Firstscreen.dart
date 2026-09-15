import 'package:flutter/material.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 20),
          child: Image.asset('assets/images/onboarding_1.png', height: 550),
        ),
        Container(
          margin: const EdgeInsets.only(top: 350),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Your convenience in\nmaking a todo list',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.ColorNeutralPrimary,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Here's a mobile platform that helps you create task\n"
                "or to list so that it can help you in every job\n"
                "easier and faster.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: ColorManager.ColorNeutralSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
