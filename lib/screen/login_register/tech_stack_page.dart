import 'package:circlet/components/components.dart';
import 'package:circlet/screen/login_register/add_github_page.dart';
import 'package:circlet/util/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../util/font/font.dart';

class TechStackPage extends StatefulWidget {
  const TechStackPage({super.key});

  @override
  State<TechStackPage> createState() => _TechStackPageState();
}

class _TechStackPageState extends State<TechStackPage> {
  TextEditingController techStackController = TextEditingController();
  List techList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기술스텍 등록',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '사용하는 기술스텍이 있으신가요?', style: f21bw700,
              ),
            ),
            const SizedBox(height: 29,),
            Row(
              children: [
                Container(
                  width: Get.width*0.75,
                  height: 45,
                  child: TextFormBox(
                      hintText: 'ex) Javascript',
                      textController: techStackController,
                      onTap: (){},
                      onChange: (v){}),
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    techList.add(techStackController.text);
                    techStackController.clear();
                    print(techList);
                    setState(() {

                    });
                  },
                  child: Container(
                    width: Get.width*0.17,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      color: darkGrayColor,
                    ),
                    child: Center( // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
                      child: Text(
                        '등록',
                        style: f16w500,
                      ),
                    ),
                  ),
                )

              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Text('등록한 기술스텍', style: f14bw300,),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 5, // 좌우 간격
              runSpacing: 5, // 상하 간격
              children: techList.asMap().entries.map((entry) {
                final int index = entry.key;
                final String tech = entry.value;
                return Stack(
                  children: [
                    Container(
                    padding: EdgeInsets.only(left: 7,right: 30,top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: darkGrayColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      tech,
                      style: f16w300,
                    ),
                  ),
                    Positioned(
                      top: 12,
                      right: 6,
                      child: GestureDetector(
                        onTap: () {
                          // 해당 요소를 리스트에서 삭제
                          setState(() {
                            techList.removeAt(index);
                          });

                        },
                        child: Container(
                          child: Icon(Icons.close, color: Colors.white,size: 20,),
                        ),
                      ),
                    ),
                ],
                );
              }).toList(),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                Get.to(()=>AddGithubPage());
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
                        ,fontSize: 18),
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
