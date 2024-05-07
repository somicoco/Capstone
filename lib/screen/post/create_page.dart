import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatePage extends StatefulWidget {
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  String postCategory = '게시판을 선택하세요';
  int imageCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text(
              '게시글 등록 ',
              style: TextStyle(fontSize: 22),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              color: Color(0xffEBEBEB),
              height: 1,
              thickness: 1,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 30, bottom: 12),
                  child: Text(
                    postCategory,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 27),
                  child: GestureDetector(
                    onTap: () {
                      print('카테고리 선택11');
                    },
                    child: SvgPicture.asset('assets/icon/category.svg'),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: const Color(0xffEBEBEB),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 8, top: 11, bottom: 6),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '제목',
                  hintStyle: TextStyle(fontSize: 18),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffEBEBEB)),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: GestureDetector(
                      onTap: () {
                        print('사진추가 클릭');
                        setState(() {
                          if (imageCount >= 10)
                            print('더이상 추가 불가능');
                          else
                            imageCount += 1;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xff282828)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            Stack(
                              children: [
                                Center(
                                  child: SvgPicture.asset(
                                      'assets/icon/camera.svg'),
                                ),
                                Positioned(
                                  child:
                                      SvgPicture.asset('assets/icon/plus.svg'),
                                  bottom: 0,
                                  right: 2,
                                ),
                              ],
                            ),
                            Text(
                              '${imageCount}/10',
                              style: TextStyle(
                                  fontSize: 9, color: Color(0xff858585)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PhotoWidget(imagePath: 'image/image1.png'),
                  PhotoWidget(imagePath: 'image/image2.png'),
                  PhotoWidget(imagePath: 'image/image1.png'),
                  PhotoWidget(imagePath: 'image/image2.png'),
                  PhotoWidget(imagePath: 'image/image1.png'),
                  PhotoWidget(imagePath: 'image/image2.png'),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 29),
                child: Container(
                  height: 350,
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: '내용을 입력해주세요.',
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xffABABAB)),
                      border: InputBorder.none,
                    ),
                  ),
                )),
            Divider(
              color: Color(0xffEBEBEB),
              height: 1,
              thickness: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22, top: 33, bottom: 33),
              child: GestureDetector(
                onTap: () {
                  print('코드추가 클릭');
                },
                child: Container(
                  width: 63,
                  height: 59,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff282828)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      SvgPicture.asset('assets/icon/code.svg'),
                      const SizedBox(height: 3),
                      Text('코드추가', style: TextStyle(fontSize: 9))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Color(0xff3648EB),
        child: Center(
          child:
              Text('등록하기', style: TextStyle(fontSize: 22, color: Colors.white)),
        ),
      ),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  final String imagePath;
  final double width = 60;
  final double height = 60;

  const PhotoWidget({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff282828)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}
