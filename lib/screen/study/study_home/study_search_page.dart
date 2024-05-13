import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/components.dart';
import '../../../util/color.dart';

class StudySearchPage extends StatefulWidget {
  const StudySearchPage({Key? key}) : super(key: key);

  @override
  State<StudySearchPage> createState() => _StudySearchPageState();
}

class _StudySearchPageState extends State<StudySearchPage> {
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
  List<String> popularStudyTitle = ['IOS', '게임', '안드로이드'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "DevLinkUp",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
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
                        studySearchText = Colors.grey;
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
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'NotoSans')),
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
                                text: 'iOS 개발',
                                ontap: () {
                                  print('111');
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/android.svg',
                                text: '안드로이드 개발',
                                ontap: () {
                                  print('111');
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/web.svg',
                                text: '웹개발',
                                ontap: () {
                                  print('111');
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/game.svg',
                                text: '게임 개발',
                                ontap: () {
                                  print('111');
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/security.svg',
                                text: '네트워크/보안',
                                ontap: () {
                                  print('111');
                                },
                                isLarge: false,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              IconText(
                                image: 'assets/icon/server.svg',
                                text: '백엔드/서버',
                                ontap: () {
                                  print('111');
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/frontEnd.svg',
                                text: '프론트엔드',
                                ontap: () {
                                  print('111');
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/embedded.svg',
                                text: '임베디드',
                                ontap: () {
                                  print('111');
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/ai.svg',
                                text: '인공지능',
                                ontap: () {
                                  print('111');
                                },
                                isLarge: false,
                              ),
                              Spacer(),
                              IconText(
                                image: 'assets/icon/grid.svg',
                                text: '전체보기',
                                ontap: () {
                                  print('111');
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
                            onTap: () {},
                            child: Text(
                              "더보기",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'NotoSans',
                                  color: Color(0xff909090)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: postTitle.length,
                      itemBuilder: (context, index) {
                        final backgroundColor = interestBackgroundColor[popularStudyTitle[index]];
                        final textColor = interestTextColor[popularStudyTitle[index]];
                        return Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: GestureDetector(
                            onTap: () {},
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
                                            popularStudyTitle[index],
                                            style: TextStyle(
                                              color: textColor ?? Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NotoSans',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          postTitle[index],
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
                                              Text('대전광역시 유성구', style: f10dgw500),
                                              Spacer(),
                                              Text('멤버 6', style: f10dgw500),
                                              Spacer(),
                                              Text('조회 8', style: f10dgw500),
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
                      padding: EdgeInsets.only(left: 14, right: 9, top: 32),
                      child: Row(
                        children: [
                          Text(
                            "신규 스터디",
                            style: f18bw700,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "더보기",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'NotoSans',
                                  color: Color(0xff909090)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: postTitle.length,
                      itemBuilder: (context, index) {
                        final backgroundColor = interestBackgroundColor[popularStudyTitle[index]];
                        final textColor = interestTextColor[popularStudyTitle[index]];
                        return Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: GestureDetector(
                            onTap: () {},
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
                                        'assets/image/example/ex3.png',
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
                                            popularStudyTitle[index],
                                            style: TextStyle(
                                              color: textColor ?? Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NotoSans',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          postTitle[index],
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
                                              Text('대전광역시 유성구', style: f10dgw500),
                                              Spacer(),
                                              Text('멤버 6', style: f10dgw500),
                                              Spacer(),
                                              Text('조회 8', style: f10dgw500),
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
                      padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "이런 스터디도 있어요",
                            style: f18bw700,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "더보기",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'NotoSans',
                                  color: Color(0xff909090)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: postTitle.length,
                      itemBuilder: (context, index) {
                        final backgroundColor = interestBackgroundColor[popularStudyTitle[index]];
                        final textColor = interestTextColor[popularStudyTitle[index]];
                        return Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: GestureDetector(
                            onTap: () {},
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
                                        'assets/image/example/ex3.png',
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
                                            popularStudyTitle[index],
                                            style: TextStyle(
                                              color: textColor ?? Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NotoSans',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          postTitle[index],
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
                                              Text('대전광역시 유성구', style: f10dgw500),
                                              Spacer(),
                                              Text('멤버 6', style: f10dgw500),
                                              Spacer(),
                                              Text('조회 8', style: f10dgw500),
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

Widget _buildCategoryItem(BuildContext context, String imagePath, String text) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Image.asset(
            imagePath,
            width: 54,
            height: 54,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Color(0xffF2F2F2)),
        ), // 이미지와 텍스트 사이의 간격
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 9, fontWeight: FontWeight.w700, fontFamily: 'NotoSans'),
        ),
      ],
    ),
  );
}

Widget _buildCategory(String text, String containerColor, String textColor) {
  return LayoutBuilder(
    // 컨테이너의 크기를 알 수 있음
    builder: (context, constraints) {
      final textWidth = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: constraints.maxWidth);

      final containerWidth = textWidth.width + 20;

      return Container(
        width: containerWidth,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      );
    },
  );
}
