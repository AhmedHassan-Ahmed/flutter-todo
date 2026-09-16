import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todolist/core/styles/Units.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.ColorBrandprimaryDefault,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Units.width(context, 70),
                height: Units.height(context, 70),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Units.radius(context, 13.8),
                  ),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.checklist,
                  size: Units.width(context, 70),
                  color: ColorManager.ColorBrandprimaryDefault,
                ),
              ),
              Text(
                'Todoapp ',
                style: TextStyle(
                  fontSize: Units.font(context, 26),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'The best to do list application for you ',
                style: TextStyle(
                  fontSize: Units.font(context, 14),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
