import 'package:circlet/components/components.dart';
import 'package:circlet/screen/login_register/add_blog_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../util/font/font.dart';

class AddGithubPage extends StatefulWidget {
  const AddGithubPage({super.key});

  @override
  State<AddGithubPage> createState() => _AddGithubPageState();
}

class _AddGithubPageState extends State<AddGithubPage> {
  TextEditingController githubController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('깃허브 등록',
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
        padding: EdgeInsets.only(top: 28,left:12, right: 12,bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('(선택)',style: f20w500HintGray,),
                Text('사용하는 깃허브 링크가 있나요?', style: f21bw700,)
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Text('깃허브 링크는 사용자 프로필에 명시되며 다른 유저도 볼 수 있습니다.',
              style: f12bw500,),
            Center(
              child: Text('설정에서 변경 가능합니다.',
                style: f12bw500,),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: Get.width,
              height: 45,
              child: TextFormBox(
                  hintText: '링크(선택)',
                  textController: githubController,
                  onTap: (){},
                  onChange: (v){
                    setState(() {

                    });
                  },
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text('*'),
                ),
                Text('유효하지 않은 링크는 제재를 받을 수 있습니다.',style: f12w300HintGray,),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                Get.to(AddBlogPage());
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
