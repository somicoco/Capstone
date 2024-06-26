import 'dart:io';
import 'package:circlet/components/components.dart';
import 'package:circlet/util/font/font.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'; // 추가
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PostCreatePage extends StatefulWidget {
  @override
  State<PostCreatePage> createState() => _PostCreatePageState();
  StudyInfo studyInfo;
  int selectedTab;

  PostCreatePage({this.selectedTab = 0, required this.studyInfo});
}

class _PostCreatePageState extends State<PostCreatePage> {
  String postCategory = '게시판을 선택하세요';
  int imageCount = 0;
  bool selectedFree = false;
  bool selectedQuestion = false;
  List<String> boardName = ['공지사항', '가입인사', '자유', '질문', '모임후기', '자료실'];
  List<File> imagePaths = [];
  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController contentEditingController = TextEditingController();
  List<String> imageDatePaths = [];

  final ImagePicker picker = ImagePicker();

  // 카메라 또는 갤러리의 이미지를 저장할 변수
  XFile? _imageFile;

  // 이미지를 가져오는 함수
  Future<void> getImage(ImageSource imageSource) async {
    try {
      // 카메라 또는 갤러리의 이미지
      final XFile? imageFile = await picker.pickImage(
          source: imageSource, maxHeight: 300, maxWidth: 300);

      if (imageFile != null) {
        // 이미지 파일 경로를 _addImage() 함수에 전달하여 이미지 추가
        _addImage(File(imageFile.path));
      }
    } catch (e) {
      print("에러 : $e");
    }
  }

  void _addImage(File imageFile) {
    setState(() {
      imageCount++;
      imagePaths.add(imageFile); // 이미지 파일 자체를 추가
      imageDatePaths.add(DateTime.now().toString());
    });
  }

  Future<String> _uploadImageToStorage(File imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageRef = FirebaseStorage.instance.ref().child('images/$fileName');
    UploadTask uploadTask = storageRef.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  void _showImageLimitDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('알림'),
          content: Text('이미지는 최대 10개까지 추가할 수 있습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: ListView.builder(
            itemCount: boardName.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: widget.selectedTab == index + 1
                    ? Icon(Icons.radio_button_checked)
                    : Icon(Icons.radio_button_unchecked),
                title: Text(boardName[index]),
                onTap: () {
                  setState(() {
                    widget.selectedTab = index + 1;
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

  void _removeImage(int index) {
    setState(() {
      imagePaths.removeAt(index);
      imageDatePaths.removeAt(index);
      imageCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '게시글 등록 ',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'NotoSans'),
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
                    padding:
                    const EdgeInsets.only(left: 12, top: 30, bottom: 12),
                    child: Text(
                      widget.selectedTab == 0
                          ? postCategory
                          : boardName[widget.selectedTab - 1],
                      style: f16bw500,
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
                padding:
                EdgeInsets.only(left: 12, right: 8, top: 11, bottom: 6),
                child: TextField(
                  controller: titleEditingController,
                  decoration: InputDecoration(
                    hintText: '제목',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NotoSans'),
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
                        onTap: () {
                          imageCount < 10 ?
                          getImage(ImageSource.gallery)
                              : _showImageLimitDialog();
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
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'NotoSans',
                                  color: Color(0xff858585),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ...imagePaths.asMap().entries.map((entry) {
                      int index = entry.key;
                      File imageFile = entry.value; // 이미지 파일 자체를 가져옴
                      return PhotoWidget(
                        imageFile: imageFile, // imagePath 대신 imageFile 전달
                        onDelete: () => _removeImage(index),
                      );
                    }).toList(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 0),
                child: Container(
                  height: Get.height * 0.4,
                  child: TextField(
                    controller: contentEditingController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: '내용을 입력해주세요.',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xffABABAB),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'NotoSans'),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Color(0xffD9D9D9),
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
                        Text('코드추가',
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NotoSans')),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () async {
            CollectionReference ref = FirebaseFirestore.instance.collection('posts');

            final DateTime now = DateTime.now().add(Duration(hours: 9));
            final DateFormat formatter = DateFormat('yyyy년 M월 d일 a h:mm', 'ko_KR');
            final String formattedDate = formatter.format(now);

            // 이미지 URL 업로드 리스트
            List<String> imageUrls = [];
            for (var imageFile in imagePaths) {
              String imageUrl = await _uploadImageToStorage(imageFile);
              imageUrls.add(imageUrl);
            }

            DocumentReference docRef = await ref.add({
              'studyId': '스터디아이디',
              'docId': '',
              'createDate': formattedDate,
              'author': '유저 닉네임',
              'category': boardName[widget.selectedTab - 1],
              'title': titleEditingController.text,
              'content': contentEditingController.text,
              'imagePaths': FieldValue.arrayUnion(imageUrls),
              'code': '값이없음',
              'like': false,
              'likeCount': 0,
            });

            await docRef.update({'docId': docRef.id});

            Navigator.pop(context);
          },
          child: BottomAppBar(
            height: 50,
            color: Color(0xff3648EB),
            child: Center(
              child: Text(
                '등록하기',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NotoSans'),
              ),
            ),
          ),
        ));
  }
}

class PhotoWidget extends StatelessWidget {
  final File imageFile;
  final VoidCallback onDelete;

  const PhotoWidget({required this.imageFile, required this.onDelete});

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
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image.file(imageFile, height: 60, width: 60), // 이미지파일 사진을 60,60으로 설정
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
                  'assets/icon/remove.svg',
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
