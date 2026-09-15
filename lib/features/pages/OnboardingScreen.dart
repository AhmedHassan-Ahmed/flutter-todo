import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.only(top: 20, right: 45),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: ColorManager.ColorBrandprimaryDefault,
                    fontSize: 22,
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
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: SizedBox(
                width: 220,
                height: 54,
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorManager.ColorNeutralWhite,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
