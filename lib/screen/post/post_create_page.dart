import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostCreatePage extends StatefulWidget {
  @override
  State<PostCreatePage> createState() => _PostCreatePageState();
}

class _PostCreatePageState extends State<PostCreatePage> {
  String postCategory = '게시판을 선택하세요';
  int imageCount = 0;
  bool selectedFree = false;
  bool selectedQuestion = false;
  int selectedTab = 0;
  List<String> boardName = ['공지사항', '가입인사', '자유', '질문', '모임후기', '자료실'];
  List<String> imagePaths = [];

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: ListView.builder(
            itemCount: boardName.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: selectedTab == index + 1
                    ? Icon(Icons.radio_button_checked)
                    : Icon(Icons.radio_button_unchecked),
                title: Text(boardName[index]),
                onTap: () {
                  setState(() {
                    selectedTab = index + 1;
                    postCategory = boardName[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _addImage() {
    if (imageCount < 10) {
      setState(() {
        imageCount++;
        imagePaths.add('image/pic${imageCount}.png');
      });
    } else {
      print('더 이상 이미지를 추가할 수 없습니다.');
    }
  }

  void _removeImage(int index) {
    setState(() {
      imagePaths.removeAt(index);
      imageCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            '게시글 등록 ',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, fontFamily: 'NotoSans'),
          ),
        ),
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 30, bottom: 12),
                  child: Text(
                    postCategory,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'NotoSans'),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 15, right: 27),
                  child: GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: SvgPicture.asset('assets/icon/down.svg'),
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
                  hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'NotoSans'),
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
                    padding: EdgeInsets.only(left: 12, top: 5),
                    child: GestureDetector(
                      onTap: _addImage,
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
                                    'assets/icon/camera.svg',
                                  ),
                                ),
                                Positioned(
                                  child: SvgPicture.asset(
                                    'assets/icon/plus-circle.svg',
                                  ),
                                  bottom: 0,
                                  right: 2,
                                ),
                              ],
                            ),
                            Text(
                              '$imageCount/10',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w500, fontFamily: 'NotoSans',
                                color: Color(0xff858585),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ...imagePaths.asMap().entries.map((entry) { // imagePaths를 Map으로 변환 Map의 entry를 이용해서 key와 value쌍을 반복
                    int index = entry.key;
                    String path = entry.value;
                    return PhotoWidget(
                      imagePath: path,
                      onDelete: () => _removeImage(index),
                    );
                  }).toList(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 29),
              child: Container(
                height: 200,
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: '내용을 입력해주세요.',
                    hintStyle: TextStyle(fontSize: 16, color: Color(0xffABABAB), fontWeight: FontWeight.w500, fontFamily: 'NotoSans'),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      SvgPicture.asset('assets/icon/file-dark.svg'),
                      const SizedBox(height: 3),
                      Text('코드추가', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, fontFamily: 'NotoSans')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Color(0xff3648EB),
        child: Center(
          child: Text(
            '등록하기',
            style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500, fontFamily: 'NotoSans'),
          ),
        ),
      ),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onDelete;

  const PhotoWidget({required this.imagePath, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, right: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(imagePath, height: 60, width: 60),
          ),
          Positioned(
            right: -5,
            top: -4,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icon/x_circle-.svg',
                  height: 14,
                  width: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
