import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/components.dart';
import '../../../../util/color.dart';
import '../study_home_page.dart';

class NewStudyPage extends StatefulWidget{
  @override
  State<NewStudyPage> createState() => _NewStudyPage();

}

class _NewStudyPage extends State<NewStudyPage>{
  List<StudyInfo> studyInfo1 = [ // 인기
    StudyInfo('Study1','IOS','대전광역시 유성구','안녕하세요 반갑습니다',['#플러터', '스위프트'],23,100), // 스터디 이름, 카테고리. 위치, 소개글, 멤버수, 조회수
    StudyInfo('Study2','게임','대전광역시 서구','게임개발합니다',['#플러터', '스위프트'],79, 662),
    StudyInfo('Study3','인공지능','대전광역시 동구','인공지능 같이 배워봐요',['#플러터', '스위프트'],12, 45),
  ];
  PostInfo postinfo = PostInfo(id: '12',content: '', title: '', date: '', category: '', imagePaths: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('신규 스터디', style: f22bw700),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: studyInfo1.length,
            itemBuilder: (context, index) {
              final backgroundColor = interestBackgroundColor[studyInfo1[index].studyCategory];
              final textColor = interestTextColor[studyInfo1[index].studyCategory];
              return Padding(
                padding: EdgeInsets.only(top: 17),
                child: GestureDetector(
                  onTap: () {
                    Get.to(StudyHomePage(studyInfo: studyInfo1[index], isJoined: true, postInfo: postinfo,));
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
                                  color: backgroundColor ?? Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  studyInfo1[index].studyCategory,
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
                                studyInfo1[index].studyName,
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
                                    Text(studyInfo1[index].studyLocation, style: f10dgw500),
                                    Spacer(),
                                    Text('멤버 ${studyInfo1[index].members}', style: f10dgw500),
                                    Spacer(),
                                    Text('조회 ${studyInfo1[index].views}', style: f10dgw500),
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
        )
    );
  }

}