import 'package:circlet/screen/study/study_home/search_category_page.dart';
import 'package:circlet/screen/study/study_home/study_home_page.dart';
import 'package:circlet/screen/study/study_home/study_more/new_study_page.dart';
import 'package:circlet/screen/study/study_home/study_more/popular_study_page.dart';
import 'package:circlet/screen/study/study_home/study_more/recommend_study_page.dart';
import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../components/components.dart';
import '../../../util/color.dart';

class StudySearchPage extends StatefulWidget {
  const StudySearchPage({Key? key}) : super(key: key);

  @override
  State<StudySearchPage> createState() => _StudySearchPageState();
}

class _StudySearchPageState extends State<StudySearchPage> {
  List<StudyInfo> studyInfo1 = [ // 인기
    StudyInfo('Study1','IOS','대전광역시 유성구','안녕하세요 반갑습니다', ['#플러터', '안드로이드'],23,100), // 스터디 이름, 카테고리. 위치, 소개글, 멤버수, 조회수
    StudyInfo('Study2','게임','대전광역시 서구','게임개발합니다',['#보안', '네트워크'],79, 662),
    StudyInfo('Study3','인공지능','대전광역시 동구','인공지능 같이 배워봐요',['#게임', '예시'],12, 45),
  ];

  List<StudyInfo> studyInfo2 = [ // 신규
    StudyInfo('Study4','백엔드/서버','대전광역시 유성구','안녕하세요 반갑습니다',['#백엔드'],23,100), // 스터디 이름, 카테고리. 위치, 소개글, 멤버수, 조회수
    StudyInfo('Study5','프론트엔드','대전광역시 서구','프론트엔드 개발합니다',['#프론트엔드', '백엔드'],79, 662),
    StudyInfo('Study6','임베디드','대전광역시 동구','임베디드 공부할 뿐',['#임베디드', '하드웨어'],12, 45),
  ];

  PostInfo postinfo = PostInfo(id: '12',content: '', title: '', date: '', category: '', imagePaths: []);


  Color myStudyText = Colors.black;
  Color studySearchText = Colors.grey;
  bool isMyStudyMode = true;
  List<String> postTitle = ['Study 1', 'Study 2', 'Study 3'];
  List<String> categoryList = [
    'IOS 개발',
    '안드로이드 개발',
    '웹 개발',
    '게임 개발',
    '네트워크/보안',
    '백엔드/서버',
    '프론트엔드',
    '임베디드',
    '인공지능',
    '전체보기'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "DevLinkUp",
            style: f30bw700,
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('assets/icon/x-circle-fill.svg'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 21, right: 18),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/icon/search.svg'),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(14),
            child: Divider(
              color: Color(0xffEBEBEB),
              height: 1,
              thickness: 1,
            ),
          )),
      body: SingleChildScrollView(
        // 스크롤 가능하도록 변경
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: Text(
                      "내 스터디",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NotoSans',
                          color: myStudyText),
                    ),
                    onTap: () {
                      setState(() {
                        myStudyText = Colors.black;
                        studySearchText = Color(0xff8F8F8F);
                        isMyStudyMode = true;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: Text(
                      "스터디 찾기",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NotoSans',
                          color: studySearchText),
                    ),
                    onTap: () {
                      setState(() {
                        studySearchText = Colors.black;
                        myStudyText = Colors.grey;
                        isMyStudyMode = false;
                      });
                    },
                  )
                ],
              ),
              if (isMyStudyMode)
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('안녕'),
                )
              else
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2, top: 21, bottom: 12),
                      child: Row(
                        children: [
                          Text('카테고리',
                              style: f22bw700)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconText(
                                image: 'assets/icon/apple.svg',
                                text: 'IOS 개발',
                                ontap: () {
                                  Get.to(SearchCategoryPage(categoryName: 'IOS',));
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/android.svg',
                                text: '안드로이드 개발',
                                ontap: () {
                                  Get.to(SearchCategoryPage(categoryName: '안드로이드 개발'));
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/web.svg',
                                text: '웹개발',
                                ontap: () {
                                  Get.to(SearchCategoryPage(categoryName: '웹 개발' ));
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/game.svg',
                                text: '게임 개발',
                                ontap: () {
                                  Get.to(SearchCategoryPage(categoryName: '게임 개발'));
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/security.svg',
                                text: '네트워크/보안',
                                ontap: () {
                                  Get.to(SearchCategoryPage(categoryName: '네트워크/보안' ));
                                },
                                isLarge: false,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              IconText(
                                image: 'assets/icon/server.svg',
                                text: '백엔드/서버',
                                ontap: () {
                                  Get.to(SearchCategoryPage(categoryName: '백엔드/서버' ));
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/frontEnd.svg',
                                text: '프론트엔드',
                                ontap: () {
                                  Get.to(SearchCategoryPage(categoryName: '프론트엔드' ));
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/embedded.svg',
                                text: '임베디드',
                                ontap: () {
                                  Get.to(SearchCategoryPage(categoryName: '임베디드'));
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/ai.svg',
                                text: '인공지능',
                                ontap: () {
                                  Get.to(SearchCategoryPage(categoryName: '인공지능'));
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/grid.svg',
                                text: '전체보기',
                                ontap: () {
                                  Get.to(SearchCategoryPage(categoryName: '전체보기'));
                                },
                                isLarge: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2, right: 10, top: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "인기 스터디",
                            style: f18bw700,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(PopularStudyPage());
                            },
                            child: Text(
                              "더보기",
                                style: f16w100MoreGray
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(), // 3개만 표시되는거라 스크롤 안되게
                      itemCount: studyInfo1.length,
                      itemBuilder: (context, index) {
                        final popularStudyInfo = studyInfo1[index];
                        final backgroundColor = interestBackgroundColor[popularStudyInfo.studyCategory];
                        final textColor = interestTextColor[popularStudyInfo.studyCategory];
                        return Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(StudyHomePage(studyInfo: studyInfo1[index], isJoined: true, postInfo: postinfo,));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffF1F1F1),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                  BoxShadow(
                                    color: Color(0xffF5F5F5),
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                  BoxShadow(
                                    color: Color(0xffDDDDDD),
                                    blurRadius: 10,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              height: 95,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Container(
                                      child: Image.asset(
                                        'assets/image/example/ex${index}.png',
                                      ),
                                      width: 75,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xffD7D7D7)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: backgroundColor ?? Colors.transparent,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Text(
                                            popularStudyInfo.studyCategory, // 카테고리
                                            style: TextStyle(
                                              color: textColor ?? Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'NotoSans',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          popularStudyInfo.studyName, // 스터디 이름
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'NotoSans',
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10, right: 29),
                                          child: Row(
                                            children: [
                                              Text(popularStudyInfo.studyLocation, style: f10w400DeppGray),
                                              Spacer(),
                                              Text('멤버 ${popularStudyInfo.members}', style: f10w400DeppGray),
                                              Spacer(),
                                              Text('조회 ${popularStudyInfo.views}', style: f10w400DeppGray),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2, right: 10, top: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "신규 스터디",
                            style: f18bw700,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(PopularStudyPage());
                            },
                            child: Text(
                                "더보기",
                                style: f16w100MoreGray
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(), // 3개만 표시되는거라 스크롤 안되게
                      itemCount: studyInfo2.length,
                      itemBuilder: (context, index) {
                        final newStudyInfo = studyInfo2[index];
                        final backgroundColor = interestBackgroundColor[newStudyInfo.studyCategory];
                        final textColor = interestTextColor[newStudyInfo.studyCategory];
                        return Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(StudyHomePage(studyInfo: studyInfo1[index], isJoined: true, postInfo: postinfo,));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffF1F1F1),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                  BoxShadow(
                                    color: Color(0xffF5F5F5),
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                  BoxShadow(
                                    color: Color(0xffDDDDDD),
                                    blurRadius: 10,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              height: 95,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Container(
                                      child: Image.asset(
                                        'assets/image/example/ex${index}.png',
                                      ),
                                      width: 75,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xffD7D7D7)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: backgroundColor ?? Colors.transparent,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Text(
                                            newStudyInfo.studyCategory, // 카테고리
                                            style: TextStyle(
                                              color: textColor ?? Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'NotoSans',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          newStudyInfo.studyName, // 스터디 이름
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'NotoSans',
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10, right: 29),
                                          child: Row(
                                            children: [
                                              Text(newStudyInfo.studyLocation, style: f10w400DeppGray),
                                              Spacer(),
                                              Text('멤버 ${newStudyInfo.members}', style: f10w400DeppGray),
                                              Spacer(),
                                              Text('조회 ${newStudyInfo.views}', style: f10w400DeppGray),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 2, right: 10, top: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "이런 스터디도 있어요",
                            style: f18bw700,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(PopularStudyPage());
                            },
                            child: Text(
                                "더보기",
                                style: f16w100MoreGray
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(), // 3개만 표시되는거라 스크롤 안되게
                      itemCount: studyInfo2.length,
                      itemBuilder: (context, index) {
                        final newStudyInfo = studyInfo2[index];
                        final backgroundColor = interestBackgroundColor[newStudyInfo.studyCategory];
                        final textColor = interestTextColor[newStudyInfo.studyCategory];
                        return Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(StudyHomePage(studyInfo: studyInfo2[index], isJoined: true, postInfo: postinfo,));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffF1F1F1),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                  BoxShadow(
                                    color: Color(0xffF5F5F5),
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                  BoxShadow(
                                    color: Color(0xffDDDDDD),
                                    blurRadius: 10,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              height: 95,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Container(
                                      child: Image.asset(
                                        'assets/image/example/ex${index}.png',
                                      ),
                                      width: 75,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xffD7D7D7)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: backgroundColor ?? Colors.transparent,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Text(
                                            newStudyInfo.studyCategory, // 카테고리
                                            style: TextStyle(
                                              color: textColor ?? Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'NotoSans',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          newStudyInfo.studyName, // 스터디 이름
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'NotoSans',
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10, right: 29),
                                          child: Row(
                                            children: [
                                              Text(newStudyInfo.studyLocation, style: f10w400DeppGray),
                                              Spacer(),
                                              Text('멤버 ${newStudyInfo.members}', style: f10w400DeppGray),
                                              Spacer(),
                                              Text('조회 ${newStudyInfo.views}', style: f10w400DeppGray),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}