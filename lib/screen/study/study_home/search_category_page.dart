import 'package:circlet/screen/study/study_home/study_home_page.dart';
import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../components/components.dart';
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
  List<StudyInfo> iosStudyList = [ //ios스터디 리스트
    StudyInfo('Study1','IOS','대전광역시 유성구','안녕하세요 반갑습니다',['#플러터', '스위프트'],23,100), // 스터디 이름, 카테고리. 위치, 소개글, 멤버수, 조회수
    StudyInfo('Study2','IOS','대전광역시 서구','게임개발합니다',['#플러터', '스위프트'],79, 662),
    StudyInfo('Study3','IOS','대전광역시 동구','인공지능 같이 배워봐요',['#플러터', '스위프트'],12, 45),
  ];

  @override
  void initState() {
    super.initState();
    _tabCategoryController = TabController(
        length: 10,
        vsync: this);
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

  PostInfo postinfo = PostInfo(id: '12',content: '', title: '', date: '', category: '', imagePaths: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(child: Text('카테고리',style: f20bw700,)),
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
                DecoratedTabBar(
                  tabBar: TabBar(
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
                          tabImage: 'assets/icon/security.svg', tabName: '네트워크/보안'),
                      tabCategory(
                          tabImage: 'assets/icon/server.svg', tabName: '백엔드/서버'),
                      tabCategory(
                          tabImage: 'assets/icon/frontEnd.svg', tabName: '프론트엔드'),
                      tabCategory(
                          tabImage: 'assets/icon/embedded.svg', tabName: '임베디드'),
                      tabCategory(
                          tabImage: 'assets/icon/ai.svg', tabName: '인공지능'),
                      tabCategory(
                          tabImage: 'assets/icon/grid.svg', tabName: '전체보기'),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color(0xffC6D7CB)))
                  ),
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
                            Text('시',style: f14bw300),
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
                            Text('군구',style: f14bw300),
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
                            Text('최신순',style: f14bw300),
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
                children: [ // 나중에 다시 코드 수정
                  PostList(studyInfoList: iosStudyList, interestBackgroundColor: interestBackgroundColor, interestTextColor: interestTextColor,postInfo: postinfo,),
                  PostList(studyInfoList: iosStudyList, interestBackgroundColor: interestBackgroundColor, interestTextColor: interestTextColor,postInfo: postinfo),
                  PostList(studyInfoList: iosStudyList, interestBackgroundColor: interestBackgroundColor, interestTextColor: interestTextColor,postInfo: postinfo),
                  PostList(studyInfoList: iosStudyList, interestBackgroundColor: interestBackgroundColor, interestTextColor: interestTextColor,postInfo: postinfo),
                  PostList(studyInfoList: iosStudyList, interestBackgroundColor: interestBackgroundColor, interestTextColor: interestTextColor,postInfo: postinfo),
                  PostList(studyInfoList: iosStudyList, interestBackgroundColor: interestBackgroundColor, interestTextColor: interestTextColor,postInfo: postinfo),
                  PostList(studyInfoList: iosStudyList, interestBackgroundColor: interestBackgroundColor, interestTextColor: interestTextColor,postInfo: postinfo),
                  PostList(studyInfoList: iosStudyList, interestBackgroundColor: interestBackgroundColor, interestTextColor: interestTextColor,postInfo: postinfo),
                  PostList(studyInfoList: iosStudyList, interestBackgroundColor: interestBackgroundColor, interestTextColor: interestTextColor,postInfo: postinfo),
                  PostList(studyInfoList: iosStudyList, interestBackgroundColor: interestBackgroundColor, interestTextColor: interestTextColor,postInfo: postinfo),
                ],
              ),
            ),
          ],
        ),
    );

  }
}


class PostList extends StatelessWidget {
  final List<StudyInfo> studyInfoList;
  final Map<String, Color> interestBackgroundColor;
  final Map<String, Color> interestTextColor;
  PostInfo postInfo;

   PostList({
    Key? key,
    required this.studyInfoList,
    required this.interestBackgroundColor,
    required this.interestTextColor,
     required this.postInfo
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: studyInfoList.length,
            itemBuilder: (context, index) {
              final studyInfo = studyInfoList[index];
              final backgroundColor = interestBackgroundColor[studyInfo.studyCategory];
              final textColor = interestTextColor[studyInfo.studyCategory];
              return Padding(
                padding: EdgeInsets.only(left: 11, right: 11, top: 17),
                child: GestureDetector(
                  onTap: () {
                    Get.to(StudyHomePage(studyInfo: studyInfo, isJoined: false, postInfo: postInfo,));
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
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  studyInfo.studyCategory,
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
                                studyInfo.studyName,
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
                                    Text(studyInfo.studyLocation, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
                                    Spacer(),
                                    Text('멤버 ${studyInfo.members}', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
                                    Spacer(),
                                    Text('조회수 ${studyInfo.views}', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
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
    );
  }
}




