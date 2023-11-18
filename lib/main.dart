import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'body.dart';

void main() {
  runApp(const InstaCloneApp());
}

class InstaCloneApp extends StatelessWidget {
  const InstaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InstaCloneHome(),
      theme: ThemeData(
          useMaterial3: true,
          //테마 데이터 삽입 -> 인스타가 주로 하얀색 배경이기에 하얀색 넣음
          colorScheme: const ColorScheme.light(
              primary: Colors.white, secondary: Colors.black),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black)
          //바텀 내비게이션 바 아이템의 라벨을 숨겨줌 컬러도 블랙으로 바꿔준다.
          ),
    );
  }
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }
  //initState를 통해 index 값 초기화

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index==0?AppBar(
        //AppBar가 Search로 갔을 때 보이지 않기에 index 값에 따른 삼항연산자를 넣어준다.
        centerTitle: false,
        title: Text(
          'Instagram',
          style: GoogleFonts.lobsterTwo(color: Colors.black, fontSize: 32),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
              size: 32,
            ),
            onPressed: () {
              print('Tab favorite');
            },
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.paperplane,
              size: 32,
            ),
            onPressed: () {
              print('Tab paperplane');
            },
          ),
        ],
        //구글 폰트를 추가해준 후 넣어준다.
      ):null,
      body: InstaBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newindex){
          //바텀 내비게이션 바의 onTap위에서 설명을 보면 어떤 아이템이 눌렀는지 인덱스 값을 반환한다.
          //반환된 new index 값을 index 값과 동기화 해준 후 setState를 해준다.
          setState(() {
            index = newindex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 28,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 28,), label: 'Search'),
        ],
        currentIndex: index,
      ),
    );
  }
}
