import 'package:flutter/material.dart';
import 'package:flutter_todolist/core/styles/Units.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: Units.height(context, 20)),
          child: Image.asset(
            'assets/images/onboarding_2.png',
            height: Units.height(context, 550),
          ),
        ),
        Container(
          height: Units.height(context, 150),
          margin: EdgeInsets.only(top: Units.height(context, 400)),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(0, 255, 255, 255),
                ColorManager.ColorNeutralWhite,
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: Units.height(context, 350)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Find the practicality in\nmaking your todo list',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Units.font(context, 30),
                  fontWeight: FontWeight.bold,
                  color: ColorManager.ColorNeutralPrimary,
                ),
              ),
              SizedBox(height: Units.height(context, 20)),
              Text(
                'Easy-to-understand user interface that makes you\n'
                'more comfortable when you want to create a task or\n'
                'to do list, Todayapp can also improve productivity',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Units.font(context, 17),
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
