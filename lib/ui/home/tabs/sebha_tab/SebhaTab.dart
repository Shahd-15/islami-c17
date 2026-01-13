import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int angle =0;
  int currentZekrIndex = 0;

  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  void onTapSebha() {
    setState(() {
      count++;
      angle +=5;
      if (count == 34) {
        count = 0;
        currentZekrIndex = (currentZekrIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const Spacer(flex: 2),

          Text(
            "تسبيح",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: ColorsManager.darkGoldColor,
            ),
          ),

          const Spacer(),

          Text(
            azkar[currentZekrIndex],
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textDirection: TextDirection.rtl,
          ),

          const SizedBox(height: 60),

          GestureDetector(
            onTap: onTapSebha,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle:12,
                  child: Image.asset(
                    AssetsManager.SebhaBody1,
                    width: 300,
                    height: 300,
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.darkGoldColor,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "$count / 33",
            style: const TextStyle(fontSize: 18, color: Colors.white70),
          ),

          const Spacer(flex: 3),
        ],
      ),
    );
  }
}