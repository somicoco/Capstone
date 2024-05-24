import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';

class StudyRegisterPage extends StatefulWidget {
  @override
  State<StudyRegisterPage> createState() => _StudyRegisterPageState();
}

class _StudyRegisterPageState extends State<StudyRegisterPage> {
  bool showText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('가입 신청 관리', style: f22bw500),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Divider(
            color: Color(0xffEBEBEB),
            height: 1,
            thickness: 1,
          ),
        )
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                showText = !showText;
              });
            },
            child: Padding(
                padding: EdgeInsets.only(left: 21, right: 24, bottom: 7.5, top: 4),
                child: Row(
                  children: [
                    Container(
                      width: 53,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffCDCDCD)),
                          borderRadius: BorderRadius.circular(50)),
                      child:
                          Image.asset('assets/image/example/profile_pic2.png'),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('둘리', style: f16bw500),
                        Text(
                          '신청일 2024.03.28',
                          style: f12gw300,
                        )
                      ],
                    ),
                    const SizedBox(width: 61),
                    Container(
                      width: 45,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff0DD675)),
                      child: Center(
                          child: Text(
                        '수락',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    const SizedBox(width: 25),
                    Container(
                      width: 45,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffFF4040)),
                      child: Center(
                          child: Text(
                        '거절',
                        style: TextStyle(color: Colors.white),
                      )),
                    )
                  ],
                )),
          ),
          if (showText)
            Padding(
              padding: EdgeInsets.only(left: 21, right: 21, bottom: 7.5),
              child: Container(
                child: Text(
                    '안녕하세요 저는 대전 유성구에 거주하고 있는 둘리라고 합니다 \n같이 공부하는 것을 좋아하기도 하고 여러사람들과 정보를 나누고 싶습니다. '),
              ),
            ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Color(0xffD0D0D0),
          )
        ],
      ),
    );
  }
}
