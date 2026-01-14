import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int currentZekrIndex = 0;
  double rotationAngle = 0.0;

  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  void onTapSebha() {
    setState(() {
      count++;
      rotationAngle -= (2 * math.pi / 33);

      if (count >= 33) {
        count = 0;
        currentZekrIndex = (currentZekrIndex + 1) % azkar.length;
        rotationAngle = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 10),
            child: Image.asset(
              AssetsManager.islamiHeader,
              height: 90,
            ),
          ),

          Text(
            "سبح اسم ربك الاعلي",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: ColorsManager.darkGoldColor,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30),

          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: onTapSebha,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: rotationAngle,
                      child: Image.asset(
                        AssetsManager.SebhaBody1,
                        width: 380,
                        height: 380,
                      ),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          azkar[currentZekrIndex],
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: ColorsManager.darkGoldColor,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "$count",
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.darkGoldColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}