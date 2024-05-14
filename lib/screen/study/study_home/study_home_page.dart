import 'package:circlet/util/color.dart';
import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudyHomePage extends StatefulWidget {
  String studyName = '';
  bool notice;

  StudyHomePage({required this.studyName, required this.notice});

  @override
  State<StudyHomePage> createState() => _StudyHomePageState();
}

class _StudyHomePageState extends State<StudyHomePage>
    with SingleTickerProviderStateMixin {
  //
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  } // Tab의 수 설정

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.studyName,
          style: f20bw700,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              children: [
                GestureDetector(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset('assets/icon/person.svg'),
                      Positioned(
                        bottom: 20,
                        left: 13,
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Center(
                            child: Text('3', style: f8ww700,),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  child: SvgPicture.asset('assets/icon/gear.svg'),
                )
              ],
            ),
          )
        ],
        bottom: TabBar(
          labelStyle: f12bw500,
          unselectedLabelStyle: f12hgw500,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.black,
          controller: _tabController,
          indicatorWeight: 1,
          labelPadding: EdgeInsets.symmetric(horizontal: 12),
          tabs: [
            Tab(text: '홈'),
            Tab(text: '게시판'),
            Tab(text: '일정'),
            Tab(text: '채팅')
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            // 스크롤 할 수 있게
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/image/example/study_home_pic1.png',
                      fit: BoxFit.fill,
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 19, top: 8, bottom: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 38,
                                height: 18,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: interestBackgroundColor['IOS']),
                                child: Center(
                                  child: Text(
                                    'IOS',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'NotoSans',
                                        color: interestTextColor['IOS']),
                                  ),
                                )),
                            const SizedBox(width: 13),
                            Container(
                              width: 94,
                              height: 18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffEBEBEB)),
                              child: Center(
                                child: Text('대전광역시 유성구', style: f10gw500),
                              ),
                            ),
                            const SizedBox(width: 13),
                            Container(
                              width: 41,
                              height: 18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffEBEBEB)),
                              child: Center(
                                child: Text('멤버 1', style: f10gw500),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 13),
                        Row(
                          children: [
                            Text('#플러터', style: f10gw500),
                            const SizedBox(width: 9),
                            Text('#스위프트', style: f10gw500)
                          ],
                        )
                      ],
                    )),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffF8E5E5),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 11, right: 9, top: 13),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('공지사항', style: f18bw700),
                        GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text('더 보기', style: f12hgw500),
                                const SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset('assets/icon/left.svg')
                              ],
                            ))
                      ]),
                ),
                if (widget.notice)
                  Column(
                    children: [
                      noticeItem(
                          title: '필독 운영계획', time: '2024년 2월 14일 오전 11:47'),
                      Padding(
                        padding: EdgeInsets.only(left: 22, right: 22),
                        child: Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xffF8E5E5),
                        ),
                      ),
                      noticeItem(title: '활동 수칙', time: '2024년 2월 14일 오전 11:47'),
                      Padding(
                        padding: EdgeInsets.only(left: 22, right: 22),
                        child: Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xffF8E5E5),
                        ),
                      ),
                      noticeItem(
                          title: '게시글 작성시 지침', time: '2024년 2월 14일 오전 11:47')
                    ],
                  )
                else
                  Padding(
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 14, bottom: 17),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffD4D4D4)),
                          width: MediaQuery.of(context).size.width,
                          height: 77,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('+ 공지사항 추가하기', style: f20ww700)],
                          ),
                        ),
                      )),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffF8E5E5),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 11, right: 9, top: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('소개글', style: f15bw700),
                            GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text('더 보기', style: f12hgw500),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset('assets/icon/left.svg')
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(height: 11),
                        Container(
                          child: Text(
                              '새해맞이 IOS 같이 공부하실 분 구해요. \n신입회원 모집 중 \n안녕하세요 저희는 IOS를 같이 공부하며 \n서로배워가는 스터디입니다.',
                              overflow: TextOverflow.visible,
                              style: f12bw500),
                        )
                      ],
                    )),
                SizedBox(height: 500),
              ],
            ),
          ),
          Center(
            child: Text('2'), // 게시판
          ),
          Center(
            child: Text('3'), // 일정
          ),
          Center(
            child: Text('4'), // 채팅
          ),
        ],
      ),
    );
  }
}

Widget _buildCategory(String text, String containerColor, String textColor) {
  return LayoutBuilder(
    // 컨테이너의 크기를 알 수 있음
    builder: (context, constraints) {
      final textWidth = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color('0xff${textColor}' as int)),
        ),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: constraints.maxWidth);

      final containerWidth = textWidth.width + 20;

      return Container(
        width: containerWidth,
        height: 20,
        decoration: BoxDecoration(
          color: Color('0xff${containerColor}' as int),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color('0xff${textColor}' as int))),
        ),
      );
    },
  );
}

class noticeItem extends StatelessWidget {
  String title;
  String time;

  noticeItem({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18, right: 31, top: 10, bottom: 10),
        child: Row(
          children: [
            Container(
              width: 33,
              height: 19,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff3648EB)),
              child: Center(
                child: Text(
                  '공지',
                  style: f10ww700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(title, style: f12bw700),
            ),
            Spacer(),
            Text(time, style: f8gw500),
          ],
        ));
  }
}
