import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/HadethModel.dart';
import 'package:islami_c17/ui/hadeht_details/screen/hadeth_details_screen.dart';

class HadethItem extends StatefulWidget {
  int index;
  int selectedIndex;
  HadethItem({required this.index,required this.selectedIndex});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFile();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,arguments: hadethModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: widget.selectedIndex==widget.index
              ?0
              :20
        ),

        decoration: BoxDecoration(
          color: ColorsManager.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 12,
                  left: 12,
                  right: 12
              ),
              child: Column(children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AssetsManager.hadethLeftCorner),
                        Image.asset(AssetsManager.hadethRightCorner),
                      ],),
                    Text(hadethModel?.title??"",

                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: ColorsManager.secondaryColor
                    ),)
                  ],
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(AssetsManager.hadethItemBack),
                      Text(hadethModel?.content??"",
                        textAlign: TextAlign.center,
                        maxLines: 10,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: "Janna LT",
                            fontSize: 18,
                            height: 1.6,
                            fontWeight: FontWeight.w700,
                            color: ColorsManager.secondaryColor
                        ),
                      )
                    ],
                  ),
                ),
              ],),
            ),
          ),
          Image.asset(AssetsManager.hadethMosque,width: double.infinity,fit: BoxFit.fill,)
        ],),
      ),
    );
  }
  HadethModel? hadethModel;
  loadFile()async{
    String hadeth = await rootBundle.loadString("assets/Hadeeth/h${widget.index+1}.txt");
    List<String> hadethLines = hadeth.split("\n");
    String hadethTitle = hadethLines[0].trim();
    hadethLines.removeAt(0);
    String hadethContent = hadethLines.join(" ").trim();
    hadethModel = HadethModel(
        title: hadethTitle,
        content: hadethContent,
        number: widget.index+1
    );
    setState(() {

    });
  }
}
