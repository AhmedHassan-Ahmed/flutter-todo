import 'package:flutter/material.dart';
import 'package:flutter_todolist/Router.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorManager.ColorBrandprimaryDefault,
        scaffoldBackgroundColor: ColorManager.ColorNeutralBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.ColorBrandprimaryDefault,
          primary: ColorManager.ColorBrandprimaryDefault,
          secondary: ColorManager.ColorBrandprimaryDark,
          surface: ColorManager.ColorNeutralWhite,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.ColorBrandprimaryDefault,
            foregroundColor: ColorManager.ColorNeutralWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
