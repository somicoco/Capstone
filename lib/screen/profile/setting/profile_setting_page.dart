import 'package:circlet/screen/profile/edit/edit_password.dart';
import 'package:circlet/screen/profile/edit/profile_edit_page.dart';
import 'package:circlet/util/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../util/font/font.dart';

class ProfileSettingPage extends StatefulWidget {
  const ProfileSettingPage({super.key});

  @override
  State<ProfileSettingPage> createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends State<ProfileSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필 설정',
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
        padding: EdgeInsets.only(top:18, left: 19, right: 26,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                //Get.to(()=>ProfileEditPage());
              },
              child: Row(
                children: [
                  Text('프로필 수정', style: f15bw500,),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: blackColor, size: 17,),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>EditPassword());
              },
              child: Row(
                children: [
                  Text('비밀번호 변경', style: f15bw500,),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: blackColor, size: 17,),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: (){
                print('1111');
              },
              child: Row(
                children: [
                  Text('로그아웃', style: f15bw500,),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: blackColor, size: 17,),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: (){
                print('1111');
              },
              child: Row(
                children: [
                  Text('회원탈퇴', style: f15bw500,),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: blackColor, size: 17,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
