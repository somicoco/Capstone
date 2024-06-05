import 'package:circlet/components/components.dart';
import 'package:circlet/screen/post/post_image_page.dart';
import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostViewPage extends StatefulWidget {
  @override
  State<PostViewPage> createState() => _PostViewPageState();

  final PostInfo postInfo;

  PostViewPage({required this.postInfo});
}

class _PostViewPageState extends State<PostViewPage> {
  final PageController controller = PageController();
  int currentPage = 0;

  TextEditingController textEditingController = TextEditingController();

  List<String> comments = [];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
  }

  void sendComment() {
    if (textEditingController.text.isNotEmpty)
      setState(() {
        comments.add(textEditingController.text);
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
            padding: EdgeInsets.only(right: 6),
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              icon: SvgPicture.asset('assets/icon/Menu.svg'),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  value: 'edit',
                  child: Center(
                    child: Text(
                      '수정하기',
                      style: f12bw500,
                    ),
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: 'remove',
                  child: Center(
                    child: Text(
                      '삭제하기',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w500,
                        color: Color(0xffF00B0B),
                      ),
                    ),
                  ),
                ),
              ],
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
                        '둘리',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'NotoSans'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.postInfo.date, // formattedDate 사용
                            style: TextStyle(
                                fontSize: 8,
                                color: Color(0xffABABAB),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoSans'),
                          ),
                          const SizedBox(width: 1),
                          Text(
                            '조회수 ${widget.postInfo.viewCount}',
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
                      widget.postInfo.category,
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
                    widget.postInfo.title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSans'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            widget.postInfo.imagePaths.isNotEmpty
                ? Container(
              height: 240,
              child: PageView.builder(
                controller: controller,
                itemCount: widget.postInfo.imagePaths.length,
                itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 14, right: 14),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(PostImagePage(postInfo: widget.postInfo));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 220,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.network(
                                widget.postInfo.imagePaths[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        if (widget.postInfo.imagePaths.length > 1)
                          Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 2.3,
                                top: 210),
                            child: SmoothPageIndicator(
                                controller: controller,
                                count: widget.postInfo.imagePaths.length,
                                effect: WormEffect(
                                    activeDotColor: Colors.white,
                                    dotWidth: 6,
                                    dotHeight: 6)),
                          )
                      ],
                    )),
              ),
            )
                : SizedBox(),
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 13, right: 13),
                  child: Text(
                    widget.postInfo.content,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoSans'),
                  ),
                ),
              ),
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
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.postInfo.like = !widget.postInfo.like;
                        if (widget.postInfo.like)
                          widget.postInfo.likeCount++;
                        else
                          widget.postInfo.likeCount--;
                      });
                    },
                    child: SvgPicture.asset(widget.postInfo.like
                        ? 'assets/icon/Heart.svg'
                        : 'assets/icon/emptyHeart.svg'),
                  ),
                  const SizedBox(width: 5),
                  Text('${widget.postInfo.likeCount}',
                      style: TextStyle(fontFamily: 'Bold', fontSize: 12)),
                  const SizedBox(width: 6),
                  SvgPicture.asset('assets/icon/chat.svg'),
                  const SizedBox(width: 5),
                  Text('${widget.postInfo.commentCount}',
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
            for (int i = 0; i < comments.length; i++)
              CommentWidget(
                avatarImagePath: 'assets/image/example/profile_pic.png',
                userName: '둘리',
                comment: comments[i],
                time: '2024년 2월 14일 오후 1:20',
              )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 11),
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
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: '댓글 달기...',
                    hintStyle: TextStyle(
                        fontSize: 10,
                        color: Color(0xff838383),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoSans'),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            GestureDetector(
              onTap: () {
                sendComment();
                setState(() {
                  textEditingController.clear();
                });
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
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoSans'),
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

class CommentWidget extends StatelessWidget {
  final String avatarImagePath;
  final String userName;
  final String comment;
  final String time;

  CommentWidget({
    required this.avatarImagePath,
    required this.userName,
    required this.comment,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipOval(
                  child: Image.asset(avatarImagePath),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSans',
                      ),
                    ),
                    Text(
                      comment,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoSans',
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoSans',
                        color: Color(0xffABABAB),
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                icon: SvgPicture.asset('assets/icon/Menu.svg'),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    value: 'edit',
                    child: Center(
                      child: Text(
                        '수정하기',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    value: 'remove',
                    child: Center(
                      child: Text(
                        '삭제하기',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w500,
                          color: Color(0xffF00B0B),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Color(0xffEBEBEB),
          height: 15,
          thickness: 1,
        ),
      ],
    );
  }
}
