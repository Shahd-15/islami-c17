import 'package:flutter/material.dart';
import '../../../models/onboarding_model.dart';
import '../../../widgets/onboarding_page_widget.dart';
import '../../../core/resources/ColorsManager.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboardingScreen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      image: 'assets/images/welcome1.png',
      title: 'Welcome To Islami App',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnboardingModel(
      image: 'assets/images/kabba.png',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnboardingModel(
      image: 'assets/images/welcome.png',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingModel(
      image: 'assets/images/bearish.png',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnboardingModel(
      image: 'assets/images/radio.png',
      title: 'Holy Quran Radio',
      description:
      'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),


            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(
                    data: _pages[index],
                    textColor: ColorsManager.darkGoldColor,
                  );
                },
              ),
            ),

            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? ColorsManager.darkGoldColor
                        : ColorsManager.darkGoldColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage > 0
                      ? GestureDetector(
                    onTap: _previousPage,
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: ColorsManager.darkGoldColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                      : const SizedBox(width: 40),

                  GestureDetector(
                    onTap: _nextPage,
                    child: Text(
                      _currentPage == _pages.length - 1
                          ? 'Finish'
                          : 'Next',
                      style: TextStyle(
                        color: ColorsManager.darkGoldColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
