import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //상단은 침범하지 않게 선언
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextBar(),
            SearchGrid(),
          ],
        ),
      ),
    );
  }
}

class SearchTextBar extends StatelessWidget {
  const SearchTextBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          cursorColor: Colors.black,
          //커서의 색을 바꿀 수 있음
          decoration: InputDecoration(
            //입력값을 가지는 데코레이션을 넣어야 함
            prefixIcon: Icon(Icons.search),
            hintText: '검색',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            //보더도 Input 용 보더 옵션이 있다.
            contentPadding: const EdgeInsets.all(0),
            //내부 패딩값 글자가 말려 올라가는 것을 방지해줌
            filled: true,
            fillColor: Colors.grey.shade200,
            //내부 채움 및 컬러 값
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            //활성화 되어 있을 때 보더
          ),
        ),
      ),
    );
    //입력이 가능한 텍스트 필드를 얻는다.
  }
}

final gridItems = List.generate(30, (index) => Colors.green.shade300);

class SearchGrid extends StatelessWidget {
  const SearchGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(padding: EdgeInsets.zero,
      mainAxisSpacing: 4,
      crossAxisCount: 3,
      crossAxisSpacing: 3,
      shrinkWrap: true,
      //스크롤이기에 한계를 정해줘야해서 true로
      physics: const NeverScrollableScrollPhysics(),
      children: gridItems.map((color) => Container(color: color,)).toList(),);
    //가장 그리드를 만들기 쉬운 방법 count
  }
}
