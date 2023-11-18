import 'package:flutter/material.dart';

import 'screen/home_screen.dart';
import 'screen/search_screen.dart';

class InstaBody extends StatelessWidget {
  final int index;
  const InstaBody({required this.index,super.key});



  @override
  Widget build(BuildContext context) {
    if(index == 0)
    //인덱스 값에 따른 화면전환
      {
        return HomeScreen();
      }
    return SearchScreen();
  }
}
