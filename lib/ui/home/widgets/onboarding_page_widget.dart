import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/models/onboarding_model.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingPageWidget({
    super.key,
    required this.data, required Color textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                data.image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Title
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ColorsManager.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 16),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              data.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorsManager.darkGoldColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 60),
        ],
      ),
    );
  }
}