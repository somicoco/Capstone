import 'package:circlet/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../post/post_view_page.dart';


class LoungePage extends StatefulWidget {
  @override
  State<LoungePage> createState() => _LoungePageState();
}

class _LoungePageState extends State<LoungePage> with TickerProviderStateMixin {
  late TabController _LoungePageTabController;
  final List<PostInfo> posts = [
    PostInfo('안녕', '내용1', '2024년 2월 24일 오전 11:37', '',48, 12, 34, false),
    PostInfo('반가워', '내용2', '2024년 2월 23일 오후 10:01', '',32, 18, 7, false),
  ];

  @override
  void initState() {
    super.initState();
    _LoungePageTabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _LoungePageTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              '개발자 라운지',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'NotoSans'),
            ),
            actions: [
              GestureDetector(
                child: SvgPicture.asset('assets/icon/filter.svg'),
                onTap: () {
                  print('필터 클릭');
                },
              ),
              GestureDetector(
                child: SvgPicture.asset('assets/icon/search.svg'),
                onTap: () {
                  print('검색아이콘 클릭');
                },
              ),
              const SizedBox(width: 14)
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(57),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Color(0xffEBEBEB), // 선의 색상 설정
                  ),
                  TabBar(
                    labelPadding: EdgeInsets.symmetric(horizontal: 13),
                    indicatorColor: Colors.black,
                    indicatorWeight: 2,
                    dividerColor: Color(0xffEBEBEB),
                    labelStyle: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSans',
                        color: Colors.black),
                    unselectedLabelColor: Color(0xff6E6E6E),
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _LoungePageTabController,
                    tabs: [
                      Tab(text: '전체'),
                      Tab(text: '취업'),
                      Tab(text: 'Q&A'),
                      Tab(text: '개발'),
                      Tab(text: '홍보'),
                      Tab(text: '사는얘기'),
                    ],
                  ),
                ],
              ),
            )),
        body: TabBarView(
          controller: _LoungePageTabController,
          children: [
            ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index){
                return PostItem(
                  postInfo: posts[index],
                  onHeartTap: () {
                    setState(() {
                      // Toggle like state
                      posts[index].like = !posts[index].like;

                      if (posts[index].like) {
                        posts[index].likeCount++;
                      } else {
                        posts[index].likeCount--;
                      }
                    });
                  },
                );
              },
            ),
            _buildCenterText('2'),
            _buildCenterText('3'),
            _buildCenterText('4'),
            _buildCenterText('5'),
            _buildCenterText('6'),
          ],
        ),
        floatingActionButton: Container(
          width: 66,
          height: 66,
          child: FloatingActionButton(
            onPressed: () {
              print('작성화면으로 넘어갑니다');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5), // 임의조정
                Container(
                  child: SvgPicture.asset('assets/icon/plus.svg'),
                ),
                Text(
                  '작성',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            shape: CircleBorder(),
            backgroundColor: Color(0xff3648EB),
          ),
        ));
  }



  Widget _buildCenterText(String text) {
    return Center(
      child: Text(text),
    );
  }
}

