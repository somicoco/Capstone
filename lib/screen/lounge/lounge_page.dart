import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Post {
  String title; // 제목
  String content; // 내용
  String writingTime; // 글 작성시간
  int hits; // 조회수
  int commentCount; // 댓글 수
  int likeCount; // 좋아요 수
  bool like; // 좋아요 상태
  int picCount;

  Post(this.title, this.content, this.writingTime, this.hits, this.commentCount,
      this.likeCount, this.like, this.picCount);
}

class LoungePage extends StatefulWidget {
  @override
  State<LoungePage> createState() => _LoungePageState();
}

class _LoungePageState extends State<LoungePage> with TickerProviderStateMixin {
  late TabController _LoungePageTabController;
  final List<Post> posts = [
    Post('안녕', '내용1', '2024년 2월 24일 오전 11:37', 48, 12, 34, false, 2),
    Post('반가워', '내용2', '2024년 2월 23일 오후 10:01', 32, 18, 7, false, 3),
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
                  post: posts[index],
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

class PostItem extends StatelessWidget {
  final Post post;
  final VoidCallback onHeartTap;

  const PostItem({Key? key, required this.post, required this.onHeartTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, top: 26, bottom: 10),
          child: Row(
            children: [
              GestureDetector(
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          'assets/image/example/profile_pic.png',
                          fit: BoxFit.cover,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '둘리',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSans',
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  print('유저 프로필이나 이름 클릭');
                },
              ),
              Spacer(),
              Text(
                post.writingTime,
                style: TextStyle(
                    fontSize: 8,
                    color: Color(0xffABABAB),
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 1), // 너무 가까워보임
              Text('조회수 ${post.hits}',
                  style: TextStyle(
                      fontSize: 8,
                      color: Color(0xffABABAB),
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500)),
              SizedBox(width: 32),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      post.title,
                      maxLines: null,
                      overflow: TextOverflow.visible,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'NotoSans'),
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                  Text(
                    post.content,
                    maxLines: null,
                    overflow: TextOverflow.visible,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, fontFamily: 'NotoSans'),
                  ),
                  const SizedBox(height: 4),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 28, // 여기 부분 수정해야함
                        height: 220,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.black)),
                        child: Image.asset(
                          'assets/image/example/profile_study_pic.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 7,
                        right: 7,
                        child: Container(
                            width: 29,
                            height: 26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff7E889C)),
                            child: Center(
                              child: Text('${post.picCount}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontFamily: 'NotoSans', fontWeight: FontWeight.w700)),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 100,
        ),
        _ThinBottomLine(),
        Padding(
          padding: EdgeInsets.only(left: 21, top: 11, bottom: 16),
          // 위 아래 12하면 가운데
          child: Row(
            children: [
              GestureDetector(
                onTap: onHeartTap,
                child: SvgPicture.asset(post.like
                    ? 'assets/icon/Heart.svg'
                    : 'assets/icon/emptyHeart.svg'),
              ),
              const SizedBox(width: 5),
              Text('${post.likeCount}',
                  style: TextStyle(fontFamily: 'Bold', fontSize: 12, fontWeight: FontWeight.w700)),
              const SizedBox(width: 6),
              SvgPicture.asset('assets/icon/chat.svg'),
              const SizedBox(width: 5),
              Text('${post.commentCount}',
                  style: TextStyle(fontFamily: 'NotoSans', fontSize: 12, fontWeight: FontWeight.w700)),
              Spacer(),
              Text('Q&A',
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500,
                      color: Color(0xffABABAB))),
              const SizedBox(width: 29)
            ],
          ),
        ),
        _ThickBottomLine()
      ],
    );
  }

  Widget _ThinBottomLine() {
    return Container(
      color: Color(0xffEBEBEB),
      height: 1,
      width: double.infinity,
    );
  }

  Widget _ThickBottomLine() {
    return Container(
      color: Color(0xffEBEBEB),
      height: 10,
      width: double.infinity,
    );
  }
}
