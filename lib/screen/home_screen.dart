import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children:
              List.generate(10, (index) => UserStory(userName: 'User $index'))),
      //0~9까지 List를 만들어주는 함수
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(40)),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
}

final feedDataList = [
  FeedData(userName: 'User1', likeCount: 30, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'User2', likeCount: 10, content: '오늘 아침은 맛있었다.'),
  FeedData(userName: 'User3', likeCount: 20, content: '오늘 학식은 맛있었다.'),
  FeedData(userName: 'User4', likeCount: 34, content: '오늘 도시락은 맛있었다.'),
  FeedData(userName: 'User5', likeCount: 27, content: '오늘 외식은 맛있었다.'),
  FeedData(userName: 'User6', likeCount: 32, content: '오늘 쿠키은 맛있었다.'),
  FeedData(userName: 'User7', likeCount: 39, content: '오늘 데마시아은 맛있었다.'),
  FeedData(userName: 'User8', likeCount: 50, content: '오늘 녹서스은 맛있었다.'),
];
//목 데이터 생성

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        //리스트가 두개면 무한으로 늘어나기에 어느정도 한계를 부여하는 모습
        physics: const NeverScrollableScrollPhysics(),
        itemCount: feedDataList.length,
        itemBuilder: (context, index) =>
            FeedItem(feedData: feedDataList[index]));
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //좋아요 위치 조정을 위한 start
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //사이를 떨어뜨려주기위한 spaceBetween
            //...상태 표시줄을 추가하기위해 Row안에 Row를 넣어준 모습
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade300),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(feedData.userName),
                ],
              ),
              Icon(Icons.more_vert)
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.chat_bubble)),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.paperplane)),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 4),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: feedData.userName,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: feedData.content,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}
