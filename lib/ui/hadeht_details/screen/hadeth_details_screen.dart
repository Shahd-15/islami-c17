import 'package:flutter/material.dart';
import 'package:islami_c17/model/HadethModel.dart';

import '../../../core/resources/AssetsManager.dart';
import '../../../core/resources/ColorsManager.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadeth";
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: ColorsManager.secondaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
            color: ColorsManager.primaryColor
        ),
        title: Text('Hadith ${hadethModel.number}'),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: ColorsManager.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,top: 18
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.quranLeftCorner),
                      Text(hadethModel.title,style:TextStyle(
                          color: ColorsManager.primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700
                      ) ,),
                      Image.asset(AssetsManager.quranRightCorner),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(hadethModel.content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 2.5,
                            color: ColorsManager.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.quranMosque)
        ],
      ),
    );
  }
}
