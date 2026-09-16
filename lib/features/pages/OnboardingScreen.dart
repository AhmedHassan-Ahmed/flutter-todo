import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/core/styles/Units.dart';
import 'package:flutter_todolist/core/styles/color_manager.dart';
import 'package:flutter_todolist/features/pages/Firstscreen.dart';
import 'package:flutter_todolist/features/pages/Secondscreen.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  int currentPage = 0;

  final int pageLength = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: Units.height(context, 20),
                  right: Units.width(context, 45),
                ),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: ColorManager.ColorBrandprimaryDefault,
                    fontSize: Units.font(context, 22),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: const [FirstPage(), SecondPage()],
              ),
            ),
            DotsIndicator(
              dotsCount: pageLength,
              position: currentPage.toDouble(),
              decorator: DotsDecorator(
                size: Size.square(Units.width(context, 9.0)),
                activeSize: Size(
                  Units.width(context, 18.0),
                  Units.height(context, 9.0),
                ),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Units.radius(context, 5.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: Units.height(context, 24)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Units.width(context, 48),
              ),
              child: SizedBox(
                width: Units.width(context, 220),
                height: Units.height(context, 54),
                child: ElevatedButton(
                  onPressed: () {
                    if (currentPage < pageLength - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      context.pushReplacement('/login');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.ColorBrandprimaryDefault,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Units.radius(context, 20),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: Units.width(context, 16),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: Units.font(context, 18),
                      color: ColorManager.ColorNeutralWhite,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Units.height(context, 20)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
