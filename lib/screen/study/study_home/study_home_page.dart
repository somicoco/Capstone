import 'package:circlet/components/components.dart';
import 'package:circlet/screen/post/post_create_page.dart';
import 'package:circlet/screen/post/post_view_page.dart';
import 'package:circlet/screen/study/study_chat_page.dart';
import 'package:circlet/screen/study/study_register_page.dart';
import 'package:circlet/util/color.dart';
import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StudyHomePage extends StatefulWidget {
  StudyInfo studyInfo; // 스터디 정보
  bool notice; // 공지가 있는지 없는지
  bool isJoined; // 해당 스터디에 가입이 되어있는지
  PostInfo postInfo; // 스터디에 대한 게시글들
  int categoryIndex;

  StudyHomePage(
      {required this.studyInfo,
      this.notice = true,
      this.isJoined = false,
      required this.postInfo,
      this.categoryIndex = 0});

  @override
  State<StudyHomePage> createState() => _StudyHomePageState();
}

class _StudyHomePageState extends State<StudyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // tab컨트롤러
  int _selectedCategoryIndex = 0; // 게시판에 있는 카테고리 인덱스

  String join = '스터디 가입하기'; // 스터디에 가입이 되었지않으면 스터디 가입하기 가입신청을 하면 대기중으로

  List<PostInfo> postInfoList = [ // 게시글 정보리스트 여기에다가 나중에 postInfo를 저장해야함
    PostInfo(
        '안녕', '반가워', '2024년 2월 24일 오전 11:37', '가입인사', 48, 12, 34, false,['assets/image/example/profile_pic.png','assets/image/example/profile_pic2.png']),
    PostInfo('이거 어떻게 해요?', '궁금합니다', '2024년 2월 23일 오후 10:01', '질문', 32, 18, 7,
        false, ['assets/image/example/ex1.png','assets/image/example/ex2.png','assets/image/example/ex3.png']),
    PostInfo(
        '필독 운영 계획', '필독입니다', '2024년 2월 14일 오전 11:47', '공지', 8, 0, 0, false,['assets/image/example/ddochi.png']),
  ];

  final List<Message> messages = []; // 메시지 리스트
  final TextEditingController textEditController = TextEditingController(); // 메시지 값을 전달하기 위한 컨트롤러
  final ScrollController _scrollController = ScrollController(); // 스크롤 컨트롤러 채팅 보내면 자동으로 스크롤되기 위해서


  @override
  void initState() {
    super.initState();
    setState(() {
      widget.postInfo.title.length > 0 ?
          postInfoList.insert(0,widget.postInfo) : null;
    });
    _tabController = TabController(length: 4, vsync: this); //탭 4개
    _tabController.addListener(_handleTabSelection); // 탭이 선택될 때 _handle함수 호출
    _scrollController.addListener(_scrollListener); // 스크롤의 위치가 변할 때 스크롤리스너 호출
  } // Tab의 수 설정

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _sendMessage() { //  메시지전송 할 때 뭐라도 적혀있으면 전송
    if (textEditController.text.isNotEmpty) {
      setState(() {
        messages.add(Message(textEditController.text, true,'나')); // 메시지에다가 보낼 메시지, 자신인지,  user이름
        textEditController.clear(); // 그리고 텍스트 클리어
      });
      _scrollToBottom(); // 스크롤바텀 호출
    }
  }

  void _receiveMessage() { // 메시지 받을 때인데 일단 더블탭으로 메시지 받을 때를 구현
    if (textEditController.text.isNotEmpty) {
      setState(() {
        messages.add(Message(textEditController.text, false,'둘리'));
        textEditController.clear();
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() { // 메시지를 보내거나 받았을 때 스크롤을 아래로 내려줌 근데 한 개가 밀림
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollListener() {
    setState(() {
    });
  }

  void _handleTabSelection() {
    setState(() {}); //
  }

  void _onCategoryTap(int index) { // _selectedCategoryIndex의 값에 따라 나오는 화면 다르게하기 위해서
    setState(() {
      _selectedCategoryIndex =
          index; //_onCategoryTab이 _selectedCategoryIndex를 변환
    });
  }

  void _showJoinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: Get.width,
            height: Get.width * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            padding: EdgeInsets.only(left: 10, right: 10, top: 31),
            child: Column(
              children: [
                Text(
                  '가입 신청',
                  style: f20bw700,
                ),
                SizedBox(height: 52),
                Text(
                  '${widget.studyInfo.studyName}에 가입 신청을 하시겠습니까?',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'NotoSans',
                      color: Color(0xff3D3D3D)),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 22, right: 22, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 85,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffC5C5C5)),
                          child: Center(
                              child: Text(
                            '취소',
                            style: f20w500,
                          )),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            join = '가입신청 중';
                            widget.isJoined = true;
                            Navigator.of(context).pop();
                          });
                        },
                        child: Container(
                          width: 85,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff3D3D3D)),
                          child: Center(
                              child: Text(
                            '신청',
                            style: f20w500,
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: Get.width,
            height: Get.width * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            padding: EdgeInsets.only(left: 10, right: 10, top: 31),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Text(
                  '스터디 가입 신청이 완료되었습니다.\n스터디장이 승인하면 스터디에 가입됩니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NotoSans',
                    color: Color(0xff3D3D3D),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 22, right: 22, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          join = '스터디 가입하기';
                          widget.isJoined = false;
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 85,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff3D3D3D)),
                          child: Center(
                              child: Text(
                            '신청취소',
                            style: f20w500,
                          )),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                        child: Container(
                          width: 85,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffC5C5C5)),
                          child: Center(
                              child: Text(
                            '닫기',
                            style: f20w500,
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.studyInfo.studyName,
            style: f20bw700,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  _tabController.index == 0 ?
                  GestureDetector(
                    onTap: () {
                      Get.to(StudyRegisterPage());
                    },
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
                              child: Text(
                                '1',
                                style: f8w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ) : SizedBox(),
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
              Tab(
                text: '홈',
              ),
              Tab(text: '게시판'),
              Tab(text: '일정'),
              Tab(text: '채팅'),
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
                                      color: interestBackgroundColor[
                                          widget.studyInfo.studyCategory]),
                                  child: Center(
                                    child: Text(
                                      widget.studyInfo.studyCategory,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'NotoSans',
                                          color: interestTextColor[
                                              widget.studyInfo.studyCategory]),
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
                                  child: Text(widget.studyInfo.studyLocation,
                                      style: f10gw500),
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
                                  child: Text('멤버 ${widget.studyInfo.members}',
                                      style: f10gw500),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 13),
                          Row(
                            children: [
                              for (int i = 0;
                                  i < widget.studyInfo.tags.length;
                                  i++) ...[
                                Text(widget.studyInfo.tags[i], style: f10gw500),
                                const SizedBox(width: 9)
                              ]
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
                              onTap: () {
                                _tabController.animateTo(1);
                                _onCategoryTap(1);
                              },
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
                        noticeItem(postInfo: widget.postInfo),
                        Padding(
                          padding: EdgeInsets.only(left: 22, right: 22),
                          child: Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xffF8E5E5),
                          ),
                        ),
                        noticeItem(postInfo: widget.postInfo),
                        Padding(
                          padding: EdgeInsets.only(left: 22, right: 22),
                          child: Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xffF8E5E5),
                          ),
                        ),
                        noticeItem(postInfo: widget.postInfo)
                      ],
                    )
                  else
                    Padding(
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 14, bottom: 17),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(PostCreatePage(studyInfo: widget.studyInfo));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffD4D4D4)),
                            width: MediaQuery.of(context).size.width,
                            height: 77,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('+ 공지사항 추가하기', style: f20w700)],
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
                  const SizedBox(
                    height: 1000,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          postCategory(
                              name: '전체',
                              isSelected: _selectedCategoryIndex == 0,
                              onTap: () => _onCategoryTap(0)),
                          postCategory(
                              name: '공지',
                              isSelected: _selectedCategoryIndex == 1,
                              onTap: () => _onCategoryTap(1)),
                          postCategory(
                              name: '가입인사',
                              isSelected: _selectedCategoryIndex == 2,
                              onTap: () => _onCategoryTap(2)),
                          postCategory(
                              name: '자유',
                              isSelected: _selectedCategoryIndex == 3,
                              onTap: () => _onCategoryTap(3)),
                          postCategory(
                              name: '질문',
                              isSelected: _selectedCategoryIndex == 4,
                              onTap: () => _onCategoryTap(4)),
                          postCategory(
                              name: '모임후기',
                              isSelected: _selectedCategoryIndex == 5,
                              onTap: () => _onCategoryTap(5)),
                          postCategory(
                              name: '자료실',
                              isSelected: _selectedCategoryIndex == 6,
                              onTap: () => _onCategoryTap(6)),
                        ],
                      ),
                    ),
                    _selectedCategoryIndex == 0 && postInfoList.length > 0
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: postInfoList.length,
                            itemBuilder: (context, index) {
                              return PostItem(
                                postInfo: postInfoList[index],
                                onHeartTap: () {
                                  setState(() {
                                    postInfoList[index].like =
                                        !postInfoList[index].like;
                                    if (postInfoList[index].like) {
                                      postInfoList[index].likeCount++;
                                    } else {
                                      postInfoList[index].likeCount--;
                                    }
                                  });
                                },
                              );
                            },
                          )
                        : _selectedCategoryIndex == 1 &&
                                postInfoList
                                        .where((post) => post.category == '공지')
                                        .length >
                                    0
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: postInfoList
                                    .where((post) => post.category == '공지')
                                    .length,
                                itemBuilder: (context, index) {
                                  final noticePosts = postInfoList
                                      .where((post) => post.category == '공지')
                                      .toList();
                                  return PostItem(
                                    postInfo: noticePosts[index],
                                    onHeartTap: () {
                                      setState(() {
                                        noticePosts[index].like =
                                            !noticePosts[index].like;
                                        if (noticePosts[index].like) {
                                          noticePosts[index].likeCount++;
                                        } else {
                                          noticePosts[index].likeCount--;
                                        }
                                      });
                                    },
                                  );
                                },
                              )
                            : _selectedCategoryIndex == 2 &&
                                    postInfoList
                                            .where((post) =>
                                                post.category == '가입인사')
                                            .length >
                                        0
                                ? ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: postInfoList
                                        .where(
                                            (post) => post.category == '가입인사')
                                        .length,
                                    itemBuilder: (context, index) {
                                      final joinPosts = postInfoList
                                          .where(
                                              (post) => post.category == '가입인사')
                                          .toList();
                                      return PostItem(
                                        postInfo: joinPosts[index],
                                        onHeartTap: () {
                                          setState(() {
                                            joinPosts[index].like =
                                                !joinPosts[index].like;
                                            if (joinPosts[index].like) {
                                              joinPosts[index].likeCount++;
                                            } else {
                                              joinPosts[index].likeCount--;
                                            }
                                          });
                                        },
                                      );
                                    },
                                  )
                                : _selectedCategoryIndex == 3 &&
                                        postInfoList
                                                .where((post) =>
                                                    post.category == '자유')
                                                .length >
                                            0
                                    ? ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: postInfoList
                                            .where(
                                                (post) => post.category == '자유')
                                            .length,
                                        itemBuilder: (context, index) {
                                          final freePosts = postInfoList
                                              .where((post) =>
                                                  post.category == '자유')
                                              .toList();
                                          return PostItem(
                                            postInfo: freePosts[index],
                                            onHeartTap: () {
                                              setState(() {
                                                freePosts[index].like =
                                                    !freePosts[index].like;
                                                if (freePosts[index].like) {
                                                  freePosts[index].likeCount++;
                                                } else {
                                                  freePosts[index].likeCount--;
                                                }
                                              });
                                            },
                                          );
                                        },
                                      )
                                    : _selectedCategoryIndex == 4 &&
                                            postInfoList
                                                    .where((post) =>
                                                        post.category == '질문')
                                                    .length >
                                                0
                                        ? ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: postInfoList
                                                .where((post) =>
                                                    post.category == '질문')
                                                .length,
                                            itemBuilder: (context, index) {
                                              final qnaPosts = postInfoList
                                                  .where((post) =>
                                                      post.category == '질문')
                                                  .toList();
                                              return PostItem(
                                                postInfo: qnaPosts[index],
                                                onHeartTap: () {
                                                  setState(() {
                                                    qnaPosts[index].like =
                                                        !qnaPosts[index].like;
                                                    if (qnaPosts[index].like) {
                                                      qnaPosts[index]
                                                          .likeCount++;
                                                    } else {
                                                      qnaPosts[index]
                                                          .likeCount--;
                                                    }
                                                  });
                                                },
                                              );
                                            },
                                          )
                                        : _selectedCategoryIndex == 5 &&
                                                postInfoList
                                                        .where((post) =>
                                                            post.category ==
                                                            '모임후기')
                                                        .length >
                                                    0
                                            ? ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: postInfoList
                                                    .where((post) =>
                                                        post.category == '모임후기')
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  final reviewPosts =
                                                      postInfoList
                                                          .where((post) =>
                                                              post.category ==
                                                              '모임후기')
                                                          .toList();
                                                  return PostItem(
                                                    postInfo:
                                                        reviewPosts[index],
                                                    onHeartTap: () {
                                                      setState(() {
                                                        reviewPosts[index]
                                                                .like =
                                                            !reviewPosts[index]
                                                                .like;
                                                        if (reviewPosts[index]
                                                            .like) {
                                                          reviewPosts[index]
                                                              .likeCount++;
                                                        } else {
                                                          reviewPosts[index]
                                                              .likeCount--;
                                                        }
                                                      });
                                                    },
                                                  );
                                                },
                                              )
                                            : _selectedCategoryIndex == 6 &&
                                                    postInfoList
                                                            .where((post) =>
                                                                post.category ==
                                                                '자료실')
                                                            .length >
                                                        0
                                                ? ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: postInfoList
                                                        .where((post) =>
                                                            post.category ==
                                                            '자료실')
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final dataPosts =
                                                          postInfoList
                                                              .where((post) =>
                                                                  post.category ==
                                                                  '자료실')
                                                              .toList();
                                                      return PostItem(
                                                        postInfo:
                                                            dataPosts[index],
                                                        onHeartTap: () {
                                                          setState(() {
                                                            dataPosts[index]
                                                                    .like =
                                                                !dataPosts[
                                                                        index]
                                                                    .like;
                                                            if (dataPosts[index]
                                                                .like) {
                                                              dataPosts[index]
                                                                  .likeCount++;
                                                            } else {
                                                              dataPosts[index]
                                                                  .likeCount--;
                                                            }
                                                          });
                                                        },
                                                      );
                                                    },
                                                  )
                                                : Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 23,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 66),
                                                            child: Text(
                                                                '최근 게시글이 없어요',
                                                                style:
                                                                    f20bw700)),
                                                        const SizedBox(height: 30),
                                                        Text(
                                                            '게시글을 작성해보는건 어떠신가요?',
                                                            style: f14gw500)
                                                      ],
                                                    ),
                                                  )
                  ]),
            ),
            Center(
              child: Text('3'), // 일정
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final bool showProfile = index == 0 || messages[index - 1].userId != message.userId; // 처음으로 보내는 사람이 아니거나 연속으로 보내는 사람이 아니면 프로필 나타냄
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          mainAxisAlignment: message.isUserMessage
                              ? MainAxisAlignment.end : MainAxisAlignment.start,
                          children: [
                            (!message.isUserMessage  && showProfile) ?  // 메시지를 보낸사람이 내가 아니고 다른사람일 때 and 연속으로 보낸게 아닐 때
                            Padding(
                                padding: EdgeInsets.only(right: 10, top: 15),
                                child: GestureDetector(
                                  onTap: (){
                                  },
                                  child: Container(
                                    width: 41,
                                    height: 41,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Image.asset(
                                        'assets/image/example/profile_pic2.png'),
                                  ),
                                )
                            ):
                            Padding(
                              padding: EdgeInsets.only(right: 10,top: 15),
                              child: Container(
                                width: 41,
                                height: 41,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (!message.isUserMessage && showProfile)
                                  Padding(padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      '둘리',
                                      style: f12bw500,
                                    ),),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    message.isUserMessage ? Text('오전 11:09', style: f8bw500) : SizedBox(),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4, right: 9),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 15),
                                        decoration: BoxDecoration(
                                          color: Color(0xffEFEFEF),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          message.text,
                                          style: f12bw500,
                                        ),
                                      ),
                                    ),
                                    !message.isUserMessage ? Text('오전 11:09', style: f8bw500) : SizedBox(),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 2, bottom: 14),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 14),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Color(0xffEBEBEB),
                        ),),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 38,
                              child: TextField(
                                controller: textEditController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffF2F2F2),
                                  hintText: '메시지 보내기',
                                  hintStyle: TextStyle(
                                      fontSize: 11,
                                      fontFamily: 'NotoSans',
                                      fontWeight: FontWeight.w500),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onDoubleTap: () {
                              _receiveMessage();
                            },
                            onTap: () {
                              _sendMessage();
                            },
                            child: SvgPicture.asset('assets/icon/send.svg'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: _tabController.index == 0
            ? Container(
                margin: EdgeInsets.only(bottom: 7),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff3479FF)),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      widget.isJoined
                          ? _showCancelDialog(context)
                          : _showJoinDialog(context);
                    });
                  },
                  label: Center(
                    child: Text(join, style: f22w400),
                  ),
                  backgroundColor: Color(0xff3479FF),
                ),
              )
            : _tabController.index == 1
                ? Container(
                    width: 66,
                    height: 66,
                    child: FloatingActionButton(
                      onPressed: () {
                        Get.to(PostCreatePage(
                            selectedTab: _selectedCategoryIndex,
                            studyInfo: widget.studyInfo));
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
                  )
                : null);
  }
}

class postCategory extends StatefulWidget {
  String name;
  final bool isSelected;
  final VoidCallback onTap;

  postCategory(
      {required this.name, required this.isSelected, required this.onTap});

  @override
  State<postCategory> createState() => _postCategoryState();
}

class _postCategoryState extends State<postCategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.name.length == 2
            ? 38
            : widget.name.length == 3
                ? 44
                : widget.name.length == 4 ? 50 : 56,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color(0xffE5E5E5)),
          color: widget.isSelected
              ? Color(0xff444444)
              : Colors.white, // 선택되면 444444색깔로 바뀜
        ),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'NotoSans',
              color: widget.isSelected
                  ? Colors.white
                  : Color(0xff6E6E6E), // 선택되면 글씨색 하얀색으로
            ),
          ),
        ),
      ),
    );
  }
}
