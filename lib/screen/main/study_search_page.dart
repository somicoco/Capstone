import 'package:circlet/components/components.dart';
import 'package:flutter/material.dart';



class TestSearchPage extends StatefulWidget {
  const TestSearchPage({super.key});

  @override
  State<TestSearchPage> createState() => _TestSearchPageState();
}

class _TestSearchPageState extends State<TestSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DevLinkUp1233444'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('카테고리'),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconText(image: 'assets/icon/apple.svg', text: 'iOS 개발', ontap: (){
                          print('111');
                        },isLarge: false,),
                        Spacer(),
                        IconText(image: 'assets/icon/android.svg', text: '안드로이드 개발', ontap: (){
                          print('111');
                        },isLarge: false,),
                        Spacer(),
                        IconText(image: 'assets/icon/web.svg', text: '웹개발', ontap: (){
                          print('111');
                        },isLarge: false,),
                        Spacer(),
                        IconText(image: 'assets/icon/game.svg', text: '게임 개발', ontap: (){
                          print('111');
                        },isLarge: false,),
                        Spacer(),
                        IconText(image: 'assets/icon/security.svg', text: '네트워크/보안', ontap: (){
                          print('111');
                        },isLarge: false,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        IconText(image: 'assets/icon/server.svg', text: '백엔드/서버', ontap: (){
                          print('111');
                        }, isLarge: false,),
                        Spacer(),
                        IconText(image: 'assets/icon/frontEnd.svg', text: '프론트엔드', ontap: (){
                          print('111');
                        },isLarge: false,),
                        Spacer(),
                        IconText(image: 'assets/icon/embedded.svg', text: '임베디드', ontap: (){
                          print('111');
                        },isLarge: false,),
                        Spacer(),
                        IconText(image: 'assets/icon/ai.svg', text: '인공지능', ontap: (){
                          print('111');
                        },isLarge: false,),
                        Spacer(),
                        IconText(image: 'assets/icon/grid.svg', text: '전체보기', ontap: (){
                          print('111');
                        },isLarge: false,),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Row(
                    )
                  ],
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
