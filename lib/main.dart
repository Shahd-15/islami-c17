import 'package:flutter/material.dart';
import 'package:islami_c17/ui/home/screen/home_screen.dart';
import 'package:islami_c17/ui/home/screen/onboarding_screen.dart';
import 'package:islami_c17/ui/home/tabs/sebha_tab/SebhaTab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: OnboardingScreen.routeName,

      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        OnboardingScreen.routeName:(_)=>OnboardingScreen()

      },
    );
  }
}
