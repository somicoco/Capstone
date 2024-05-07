import 'package:circlet/screen/main/study_search_page.dart';
import 'package:circlet/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../util/font/font.dart';

class AddPortFolioPage extends StatefulWidget {
  const AddPortFolioPage({super.key});

  @override
  State<AddPortFolioPage> createState() => _AddPortFolioPageState();
}

class _AddPortFolioPageState extends State<AddPortFolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포트폴리오 등록',
          style: f22bw500,),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1), // Divider의 높이 설정
          child: Divider(
            color: Color(0xffEBEBEB), // Divider의 색상 설정
            height: 1, // Divider의 높이 설정
            thickness: 1, // Divider의 두께 설정
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 28, left: 12, right: 12, bottom: 100),
        child: Column(
          children: [
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: '(선택)',style: f20w500HintGray),
                      TextSpan(text: ' 프로필에 등록하고 싶은 포트폴리오',style: f21bw700,spellOut: true),
                    ])
            ),
            Center(child: Text('가 있나요',style: f21bw700,)),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: Get.width * 0.82,
              child: Text(
                '올리신 파일은 사용자 프로필에 명시되며 다른 유저도 볼 수 있습니다. 설정에서 변경 가능합니다.',
                style: f12bw500,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                setState(() {

                });
              },
              child: Container(
                padding: EdgeInsets.only(left: 24, right: Get.width*0.33),
                width: Get.width * 0.8,
                height: 48,
                decoration: BoxDecoration(
                    color: darkGrayColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icon/file.svg',
                      width: 20,
                      height: 20,
                    ),
                    Spacer(),
                    Text(
                      '파일등록',
                      style: TextStyle(
                          color: Color(0xffFFFFFF)
                          , fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(

            ),
            GestureDetector(
              onTap: () {
                Get.to(StudySearchPage());
                setState(() {

                });
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xff3648EB),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center( // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
                  child: Text(
                    '다음',
                    style: TextStyle(
                        color: Color(0xffFFFFFF)
                        , fontSize: 18),
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
