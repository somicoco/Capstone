import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../util/color.dart';

class SearchCategoryPage extends StatefulWidget {
  String categoryName = '';

  SearchCategoryPage({required this.categoryName});

  @override
  State<SearchCategoryPage> createState() => _SearchCategoryPageState();
}

class _SearchCategoryPageState extends State<SearchCategoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabCategoryController;
  List<String> postTitle = [
    'Study 1',
    'Study 2',
    'Study 3',
    'Study 4',
    'Study 5',
    'Study 6',
    'Study 7',
    'Study 8',
    'Study 9',
  ];
  List<String> popularStudyTitle = [
    'IOS 개발',
    'IOS 개발',
    'IOS 개발',
    'IOS 개발',
    'IOS 개발',
    'IOS 개발',
    'IOS 개발',
    'IOS 개발',
    'IOS 개발',
  ];
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
  void initState() {
    super.initState();
    _tabCategoryController = TabController(
        length: 10,
        vsync: this,
        animationDuration: const Duration(milliseconds: 800));
    selectTab();
  }

  @override
  void dispose() {
    _tabCategoryController.dispose();
    super.dispose();
  }

  void selectTab() {
    switch (widget.categoryName) {
      case 'IOS 개발':
        _tabCategoryController.animateTo(0);
        break;
      case '안드로이드 개발':
        _tabCategoryController.animateTo(1);
        break;
      case '웹 개발':
        _tabCategoryController.animateTo(2);
        break;
      case '게임 개발':
        _tabCategoryController.animateTo(3);
      case '네트워크/보안':
        _tabCategoryController.animateTo(4);
        break;
      case '백엔드/서버':
        _tabCategoryController.animateTo(5);
        break;
      case '프론트엔드':
        _tabCategoryController.animateTo(6);
        break;
      case '임베디드':
        _tabCategoryController.animateTo(7);
        break;
      case '인공지능':
        _tabCategoryController.animateTo(8);
        break;
      case '전체보기':
        _tabCategoryController.animateTo(9);
        break;
      default:
        print('에러에러에러에러');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(child: Text('카테고리')),
              ),
              Padding(
                padding: EdgeInsets.only(right: 18),
                child: GestureDetector(
                  onTap: () {
                    // 아이콘을 탭했을 때의 동작
                  },
                  child: SvgPicture.asset('assets/icon/search.svg'),
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffD0D0D0),
                  height: 1,
                ),
                TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  controller: _tabCategoryController,
                  tabs: const [
                    tabCategory(
                        tabImage: 'assets/icon/apple.svg', tabName: 'IOS 개발'),
                    tabCategory(
                        tabImage: 'assets/icon/android.svg',
                        tabName: '안드로이드 개발'),
                    tabCategory(
                        tabImage: 'assets/icon/web.svg', tabName: '웹 개발'),
                    tabCategory(
                        tabImage: 'assets/icon/game.svg', tabName: '게임 개발'),
                    tabCategory(
                        tabImage: 'assets/icon/security.svg',
                        tabName: '네트워크/보안'),
                    tabCategory(
                        tabImage: 'assets/icon/server.svg', tabName: '백엔드/서버'),
                    tabCategory(
                        tabImage: 'assets/icon/frontEnd.svg', tabName: '프론트엔드'),
                    tabCategory(
                        tabImage: 'assets/icon/embedded.svg', tabName: '임베디드'),
                    tabCategory(
                        tabImage: 'assets/icon/ai.svg', tabName: '인공지능'),
                    tabCategory(
                        tabImage: 'assets/icon/apple.svg', tabName: '전체보기'),
                  ],
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 13),
              child: Row(
                children: [
                  Container(
                      width: 90,
                      height: 28,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffBEBEBE)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 9, right: 5),
                        child: Row(
                          children: [
                            Text('시'),
                            Spacer(),
                            GestureDetector(
                              child: SvgPicture.asset('assets/icon/down.svg'),
                            )
                          ],
                        ),
                      )),
                  Spacer(),
                  Container(
                      width: 90,
                      height: 28,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffBEBEBE)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 9, right: 5),
                        child: Row(
                          children: [
                            Text('군구'),
                            Spacer(),
                            GestureDetector(
                              child: SvgPicture.asset('assets/icon/down.svg'),
                            )
                          ],
                        ),
                      )),
                  Spacer(),
                  Container(
                      width: 90,
                      height: 28,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffBEBEBE)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 9, right: 5),
                        child: Row(
                          children: [
                            Text('최신순'),
                            Spacer(),
                            GestureDetector(
                              child: SvgPicture.asset('assets/icon/down.svg'),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabCategoryController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: postTitle.length,
                          itemBuilder: (context, index) {
                            final backgroundColor = interestBackgroundColor['안드로이드'];
                            final textColor = interestTextColor['안드로이드'];
                            return Padding(
                              padding: EdgeInsets.only(left: 11, right: 11, top: 17),
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
                                                '안드로이드',
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
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: postTitle.length,
                          itemBuilder: (context, index) {
                            final backgroundColor = interestBackgroundColor['IOS'];
                            final textColor = interestTextColor['IOS'];
                            return Padding(
                              padding: EdgeInsets.only(left: 11, right: 11, top: 17),
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
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: postTitle.length,
                          itemBuilder: (context, index) {
                            final backgroundColor = interestBackgroundColor['IOS'];
                            final textColor = interestTextColor['IOS'];
                            return Padding(
                              padding: EdgeInsets.only(left: 11, right: 11, top: 17),
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
                      ],
                    ),
                  ),
                  Center(
                    child: Text('5'),
                  ),
                  Center(
                    child: Text('6'),
                  ),
                  Center(
                    child: Text('7'),
                  ),
                  Center(
                    child: Text('8'),
                  ),
                  Center(
                    child: Text('9'),
                  ),
                  Center(
                    child: Text('10'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class tabCategory extends StatelessWidget {
  final String tabImage;
  final String tabName;

  const tabCategory({Key? key, required this.tabImage, required this.tabName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Row(
      children: [
        Container(
          width: 24,
          height: 24,
          child: SvgPicture.asset(tabImage),
        ),
        const SizedBox(width: 5),
        Text(tabName, style: f9bw700)
      ],
    ));
  }
}


