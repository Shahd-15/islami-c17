import 'package:flutter/material.dart';

import 'MostRecentlyItem.dart';

class MostRecentlyList extends StatelessWidget {
  const MostRecentlyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => MostRecentlyItem(),
        separatorBuilder: (context, index) => SizedBox(width: 10,),
        itemCount: 10);
  }
}
