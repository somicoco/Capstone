import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// 글씨체 변경해야함
class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> with TickerProviderStateMixin {
  late TabController _UserProfilePageTabController;

  @override
  void initState() {
    super.initState();
    _UserProfilePageTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필'),
        actions: [
          GestureDetector(
            onTap: () {
              print('설정');
            },
            child: Padding(
              padding: EdgeInsets.only(right: 9),
              child: SvgPicture.asset('assets/icon/gear.svg'),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(
            color: Color(0xffEBEBEB),
            height: 1,
            thickness: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 27, top: 11),
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        child: Image.asset('assets/image/example/profile_pic.png'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('사진 수정 클릭');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 85, top: 63),
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset('assets/icon/modify2.svg',
                          fit: BoxFit.contain),
                    ),
                  )
                ]),
                SizedBox(
                  width: 25,
                ),
                Text(
                  '둘리',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 25, top: 10),
              child: Text(
                  '관심있는 취미들을 깊게 더 나눠보고 싶어요. \n새로운 사람들과 함께 다채로운 경험을 쌓고싶어요.'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45, right: 20, top: 8),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [Text('좋아요'), Text('33')],
                    ),
                  ),
                  const SizedBox(width: 41),
                  Container(
                    child: Column(
                      children: [Text('게시글'), Text('33')],
                    ),
                  ),
                  const SizedBox(width: 41),
                  Container(
                    child: Column(
                      children: [Text('참여도'), Text('33')],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        print('일대일 채팅');
                      },
                      child: Container(
                          width: 68,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff3648EB)),
                          child: Center(
                            child: Text(
                              '1:1 채팅',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 24),
              controller: _UserProfilePageTabController,
              tabs: [Tab(text: '정보'), Tab(text: '라운지'), Tab(text: '스터디그룹')],
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 300,
              child: TabBarView(
                controller: _UserProfilePageTabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16, top: 15),
                          child: Row(
                            children: [
                              Text('관심분야'),
                              const SizedBox(width: 35),
                              Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0xffF8E5E5)),
                                child: Center(
                                  child: Text(
                                    'IOS',
                                    style: TextStyle(color: Color(0xffFC554A)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0xffE5F8EB)),
                                child: Center(
                                  child: Text(
                                    '안드로이드',
                                    style: TextStyle(
                                        color: Color(0xff00BA34),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16, top: 40),
                          child: Row(
                            children: [
                              Text('기술스텍'),
                              const SizedBox(width: 35),
                              Container(
                                width: 54,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                    '플러터',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                width: 54,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                    'Java',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                width: 54,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                    'Node.js',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 13),
                              Text('외 1개')
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16, top: 40),
                          child: Row(
                            children: [
                              Text('깃허브'),
                              const SizedBox(width: 4),
                              SvgPicture.asset('assets/icon/github.svg'),
                              const SizedBox(width: 25),
                              Container(
                                  width: 268,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Color(0xffEBEBEB)),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          hintText: 'https://github.com/dooly',
                                          hintStyle: TextStyle(fontSize: 13)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16, top: 40),
                          child: Row(
                            children: [
                              Text('블로그'),
                              const SizedBox(width: 4),
                              SvgPicture.asset('assets/icon/blog.svg'),
                              const SizedBox(width: 25),
                              Container(
                                  width: 268,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Color(0xffEBEBEB)),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          hintText:
                                          'https://velog.io/@dooly/posts',
                                          hintStyle: TextStyle(fontSize: 13)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16, top: 40),
                          child: Row(
                            children: [
                              Text('포트폴리오'),
                              const SizedBox(width: 25),
                              Stack(
                                children: [
                                  Container(
                                      width: 200,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffEBEBEB)),
                                          borderRadius:
                                          BorderRadius.circular(15)),
                                      child: Center(
                                        child: TextField(
                                          textAlignVertical:
                                          TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              hintText: '둘리 포트폴리오.pdf',
                                              hintStyle:
                                              TextStyle(fontSize: 12)),
                                        ),
                                      )),
                                  Positioned(
                                    child: GestureDetector(
                                      onTap: () {
                                        print('다운로드');
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icon/download.svg'),
                                    ),
                                    top: 5,
                                    right: 13,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        PostItem(
                          title: '새해맞이 IOS 같이 공부하실 분 구해요',
                          subtitle: '신입회원 모집 중입니다. 언제든 와주세요!',
                          image: 'assets/image/example/profile_study_pic.png',
                          likeCount: 2,
                          commentCount: 3,
                          dateTime: '2024년 2월 14일 오전 11:47',
                          viewCount: 8,
                        ),
                        PostItem(
                          title: '새해맞이 IOS 같이 공부하실 분 구해요',
                          subtitle: '신입회원 모집 중입니다. 언제든 와주세요!',
                          image: 'assets/image/example/profile_study_pic.png',
                          likeCount: 2,
                          commentCount: 3,
                          dateTime: '2024년 2월 14일 오전 11:47',
                          viewCount: 8,
                        ),
                        PostItem(
                          title: '새해맞이 IOS 같이 공부하실 분 구해요',
                          subtitle: '신입회원 모집 중입니다. 언제든 와주세요!',
                          image: 'assets/image/example/profile_study_pic.png',
                          likeCount: 2,
                          commentCount: 3,
                          dateTime: '2024년 2월 14일 오전 11:47',
                          viewCount: 8,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomContainer(
                            imagePath: 'assets/image/example/profile_study_pic.png',
                            title: '[안공모] 안드로이드 스튜디오 공부 모임',
                            description:
                            '안드로이드 앱 개발할 사람들 모두 모여라~ \n소통, 배려, 존중하는 스터디입니다.',
                            numberOfPeople: 120),
                        CustomContainer(
                            imagePath: 'assets/image/example/profile_study_pic.png',
                            title: '[안공모] 안드로이드 스튜디오 공부 모임',
                            description:
                            '안드로이드 앱 개발할 사람들 모두 모여라~ \n소통, 배려, 존중하는 스터디입니다.',
                            numberOfPeople: 120),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int numberOfPeople;

  CustomContainer({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.numberOfPeople,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 92,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xffD7D7D7)),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffD7D7D7)),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const SizedBox(height: 5),
                  Container(
                    height: 40,
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.person),
                      const SizedBox(width: 2),
                      Text(
                        numberOfPeople.toString(),
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final int likeCount;
  final int commentCount;
  final String dateTime;
  final int viewCount;

  PostItem({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.likeCount,
    required this.commentCount,
    required this.dateTime,
    required this.viewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 10),
                      Text(subtitle, style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icon/emptyHeart.svg'),
                          const SizedBox(width: 5),
                          Text(likeCount.toString()),
                          const SizedBox(width: 10),
                          SvgPicture.asset('assets/icon/chat.svg'),
                          const SizedBox(width: 5),
                          Text(commentCount.toString()),
                          const SizedBox(width: 10),
                          Text(dateTime, style: TextStyle(fontSize: 8)),
                          Text('조회수 $viewCount', style: TextStyle(fontSize: 8))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: Image.asset(image),
              ),
            ],
          ),
        ),
        Divider(
          color: Color(0xffD9D9D9),
          height: 13,
          thickness: 2,
        ),
      ],
    );
  }
}
