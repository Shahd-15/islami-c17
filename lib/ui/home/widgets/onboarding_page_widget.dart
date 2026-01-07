import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';
import '../core/resources/ColorsManager.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingModel data;
  final Color textColor;

  const OnboardingPageWidget({
    super.key,
    required this.data,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const Spacer(flex: 2),

          Expanded(
            flex: 6,
            child: Image.asset(
              data.image,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            data.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor.withOpacity(0.85),
              fontSize: 15,
              height: 1.5,
            ),
          ),

          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
