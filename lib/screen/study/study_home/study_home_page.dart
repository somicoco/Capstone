import 'package:circlet/components/components.dart';
import 'package:circlet/screen/post/post_create_page.dart';
import 'package:circlet/screen/study/study_chat_page.dart';
import 'package:circlet/screen/study/study_register_page.dart';
import 'package:circlet/util/color.dart';
import 'package:circlet/util/font/font.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StudyHomePage extends StatefulWidget {
  StudyInfo studyInfo; // 스터디 정보
  bool isJoined; // 해당 스터디에 가입이 되어있는지
  PostInfo postInfo; // 스터디에 대한 게시글들
  int categoryIndex; // 카테고리 인덱스

  StudyHomePage(
      {required this.studyInfo,
      this.isJoined = false,
      required this.postInfo,
      this.categoryIndex = 0});

  @override
  State<StudyHomePage> createState() => _StudyHomePageState();
}

class _StudyHomePageState extends State<StudyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // tab 컨트롤러
  final ScrollController scrollController = ScrollController();
  int _selectedCategoryIndex = 0; // 게시판에 있는 카테고리 인덱스

  String join = '스터디 가입하기'; // 스터디에 가입이 되어있지 않으면 스터디 가입하기 가입신청을 하면 대기중으로
  List<PostInfo> postInfoList = []; // 게시글을 담는 리스트
  List<String> boardName = [
    '공지사항',
    '가입인사',
    '자유',
    '질문',
    '모임후기',
    '자료실'
  ]; // 카테고리 이름

  List<PostInfo> noticePosts = [];

  bool isLoading = false;
  DocumentSnapshot? lastDocument;
  bool hasMore = true;
  final int pageSize = 10;


  @override
  void initState() {
    super.initState();
    _fetchPosts();
    _tabController = TabController(length: 4, vsync: this); //탭 4개
    _tabController.addListener(_handleTabSelection); // tab 인덱스 변경
  } // Tab의 수 설정

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  void _onHeartTap(PostInfo postInfo) async {
    final newLike = !postInfo.like;
    final newLikeCount = newLike ? postInfo.likeCount + 1 : postInfo.likeCount - 1;

    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postInfo.id)
          .update({
        'like': newLike,
        'likeCount': newLikeCount,
      });
      print("Update successful, ${postInfo.id}, ${postInfo.likeCount}, ${postInfo.like}");
    } catch (e) {
      print("Failed to update: $e");

      setState(() {
        postInfo.like = !newLike;
        postInfo.likeCount = newLike ? newLikeCount - 1 : newLikeCount + 1;
      });
    }
  }


  void _handleTabSelection() {
    setState(() {}); //
  }

  Future<void> _fetchPosts() async {
    if (isLoading || !hasMore) return; // isLoading이 true나 hasMore이 false일 때 리턴

    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot;
    if (lastDocument == null) {
      // 맨 처음에 10개 불러올 때
      querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .orderBy('createDate', descending: true)
          .limit(pageSize)
          .get();
    } else {
      // 10개 불러오고 나서 그 다음 불러올 때
      querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .orderBy('createDate', descending: true)
          .startAfterDocument(
              lastDocument!) // lastDocument 이후부터 pageSize크기만큼 불러옴
          .limit(pageSize)
          .get();
    }

    if (querySnapshot.docs.length == 0) {
      // 남아있는
      hasMore = false;
    }

    lastDocument =
        querySnapshot.docs.isNotEmpty ? querySnapshot.docs.last : null;
    setState(() {
      postInfoList.addAll(querySnapshot.docs.map((doc) {
        return PostInfo(
            id: doc['docId'],
            title: doc['title'],
            content: doc['content'],
            date: doc['createDate'],
            category: doc['category'],
            like: doc['like'],
            likeCount: doc['likeCount'],
            imagePaths: List<String>.from(doc['imagePaths']));
      }).toList());
      noticePosts = postInfoList.where((post) => post.category == '공지사항').take(3).toList();
      isLoading = false;
    });
  }

  void _onScroll() {
    if (!scrollController.hasClients || isLoading || !hasMore) return;
    final thresholdReached = scrollController.position.extentAfter < 200;

    if (thresholdReached) {
      _fetchPosts();
    }
  }


  void _onCategoryTap(int index) {
    // 해당하는 카테고리 화면이 나오게 하기 위해서
    setState(() {
      _selectedCategoryIndex =
          index; //_onCategoryTab이 _selectedCategoryIndex를 변환
    });
  }

  void _showJoinDialog(BuildContext context) {
    // 스터디 가입이 안 되어있고 가입신청을 안한 경우
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
    // 스터디 가입이 안되어있지만 가입신청을 한 경우
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
                _tabController.index == 0 // 홈화면일 때만 신청관리가 나올 수 있게 함
                    ? GestureDetector(
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
                      )
                    : SizedBox(),
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
                if (true)
                  Column(
                    children: [
                      ...noticePosts.map((post) =>  noticeItem(postInfo: post)).toList()
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
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .orderBy('createDate', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final posts = snapshot.data?.docs ?? [];
              postInfoList = posts.map((doc) {
                return PostInfo(
                    id: doc['docId'],
                    title: doc['title'],
                    content: doc['content'],
                    date: doc['createDate'],
                    category: doc['category'],
                    like: doc['like'],
                    likeCount: doc['likeCount'],
                    imagePaths: List<String>.from(doc['imagePaths']));
              }).toList();
              return SingleChildScrollView(
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
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: postInfoList.length,
                      itemBuilder: (context, index) {
                        if (_selectedCategoryIndex == 0 ||
                            postInfoList[index].category ==
                                boardName[_selectedCategoryIndex - 1]) {
                          return PostItem(
                            postInfo: postInfoList[index],
                            onHeartTap: (){
                              _onHeartTap(postInfoList[index]);
                            },
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          Center(
            child: Text('3'), // 일정
          ),
          StudyChatPage(studyInfo: widget.studyInfo),
        ],
      ),
      floatingActionButton: _tabController.index == 0 && false
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
                    onPressed: () async {
                      final result = await Get.to(PostCreatePage(
                          selectedTab: _selectedCategoryIndex,
                          studyInfo: widget.studyInfo));

                      if (result != null) {
                        setState(() {
                          postInfoList.insert(
                              0,
                              PostInfo(
                                  id: result['docid'],
                                  title: result['title'],
                                  content: result['content'],
                                  date: result['createDate'],
                                  category: result['category'],
                                  like: result['like'],
                                  likeCount: result['likeCount'],
                                  imagePaths: result['imagePaths']));
                        });
                      }
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
              : null,
    );
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
                : widget.name.length == 4
                    ? 50
                    : 56,
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
