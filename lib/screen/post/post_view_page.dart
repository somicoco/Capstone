import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostViewPage extends StatefulWidget {
  @override
  State<PostViewPage> createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  final PageController controller = PageController();
  final int pageCount = 4;
  int currentPage = 0;
  final List<String> imageList = [
    'assets/image/example/profile_pic.png',
    'assets/image/example/profile_study_pic.png',
    'assets/image/example/profile_pic.png',
    'assets/image/example/profile_study_pic.png'
  ];
  int commentCount = 13; // 댓글 수
  int likeCount = 12; // 좋아요 수
  late bool like = false; // 좋아요 상태

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('게시글',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NotoSans'))),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 13),
            child: GestureDetector(
              onTap: () {
                print('게시글 옵션 클릭');
              },
              child: SvgPicture.asset('assets/icon/Menu.svg'),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            color: Color(0xffEBEBEB),
            height: 1,
            thickness: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12, right: 20, top: 11),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffCCCCCC)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/image/example/profile_pic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '둘리둘리',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'NotoSans'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2024년 2월 14일 오전 11:48',
                            style: TextStyle(
                                fontSize: 8,
                                color: Color(0xffABABAB),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoSans'),
                          ),
                          const SizedBox(width: 1),
                          Text(
                            '조회수 8',
                            style: TextStyle(
                                fontSize: 8,
                                color: Color(0xffABABAB),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoSans'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '공지사항',
                      style: TextStyle(
                          fontSize: 10,
                          color: Color(0xffABABAB),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'NotoSans'),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '※ 공지사항 필독',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSans'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 240,
              child: PageView.builder(
                controller: controller,
                itemCount: imageList.length,
                itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 14, right: 14),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              imageList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 2.3,
                              top: 210),
                          child: SmoothPageIndicator(
                              controller: controller,
                              count: imageList.length,
                              effect: WormEffect(
                                  activeDotColor: Colors.white,
                                  dotWidth: 6,
                                  dotHeight: 6)),
                        )
                      ],
                    )),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 13, right: 13),
                    child: Text(
                        '내용들어감내용들어감내용들어감내용들어감내용들어감내용들어감내용들어감내용들어감내용들어감내용들어감내용들어감내용들어감내용들어감내용들어감',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'NotoSans')),
                  )),
            ),
            SizedBox(
              height: 67,
            ),
            Divider(
              color: Color(0xffEBEBEB),
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 19, top: 21, bottom: 16),
              // 위 아래 12하면 가운데
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        like = !like;
                        if (like)
                          likeCount++;
                        else
                          likeCount--;
                      });
                    },
                    child: SvgPicture.asset(like
                        ? 'assets/icon/Heart.svg'
                        : 'assets/icon/emptyHeart.svg'),
                  ),
                  const SizedBox(width: 5),
                  Text('${likeCount}',
                      style: TextStyle(fontFamily: 'Bold', fontSize: 12)),
                  const SizedBox(width: 6),
                  SvgPicture.asset('assets/icon/chat.svg'),
                  const SizedBox(width: 5),
                  Text('${commentCount}',
                      style: TextStyle(fontFamily: 'Bold', fontSize: 12)),
                ],
              ),
            ),
            Divider(
              color: Color(0xffEBEBEB),
              height: 10,
              thickness: 10,
            ),
            const SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffCCCCCC)),
                        borderRadius: BorderRadius.circular(50)),
                    child: ClipOval(
                      child: Image.asset('assets/image/example/profile_pic.png'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '또치',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'NotoSans'),
                      ),
                      Text(
                        '게시글 잘 보았습니다',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'NotoSans'),
                      ),
                      Text('2024년 2월 14일 오전 11:47',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'NotoSans',
                              color: Color(0xffABABAB)))
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: GestureDetector(
                      child: SvgPicture.asset('assets/icon/Vector.svg'),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color(0xffEBEBEB),
              height: 15,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffCCCCCC)),
                        borderRadius: BorderRadius.circular(50)),
                    child: ClipOval(
                      child: Image.asset('assets/image/example/profile_pic.png'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '또치',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'NotoSans'),
                      ),
                      Text(
                        '게시글 잘 보았습니다',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'NotoSans'),
                      ),
                      Text('2024년 2월 14일 오전 11:47',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'NotoSans',
                              color: Color(0xffABABAB)))
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: GestureDetector(
                      child: SvgPicture.asset('assets/icon/Vector.svg'),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color(0xffEBEBEB),
              height: 15,
              thickness: 1,
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container( // 수정해야함 아래가 살짝 띄워져있어야함
        padding: EdgeInsets.symmetric(horizontal: 19.0),
        height: 37.0,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffF2F2F2)),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '댓글 달기...',
                    hintStyle:
                    TextStyle(fontSize: 10, color: Color(0xff838383), fontWeight: FontWeight.w500, fontFamily: 'NotoSans'),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            GestureDetector(
              onTap: () {
                print('등록');
              },
              child: Container(
                width: 56,
                height: 37,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black),
                child: Center(
                  child: Text(
                    '등록',
                    style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500, fontFamily: 'NotoSans'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
