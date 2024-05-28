import 'package:circlet/screen/login_register/add_portfolio_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/components.dart';
import '../../util/font/font.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  TextEditingController blogController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('블로그 등록1',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('(선택)', style: f20w500HintGray,),
                Text('사용하는 기술블로그가 있나요?', style: f21bw700,)
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Text('기술블로그 링크는 사용자 프로필에 명시되며 다른 유저도 볼 수 ',
              style: f12bw500,),
            Text('있습니다. 설정에서 변경 가능합니다.',
              style: f12bw500,),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: Get.width * 0.88,
              height: 45,
              child: TextFormBox(
                hintText: '링크(선택)',
                textController: blogController,
                onTap: () {},
                onChange: (v) {
                  setState(() {

                  });
                },
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Container(
                width: Get.width * 0.88,
                child: Text(
                  '* 유효하지 않은 링크는 제재를 받을 수 있습니다.', style: f12w300HintGray,)),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(AddPortFolioPage());
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
