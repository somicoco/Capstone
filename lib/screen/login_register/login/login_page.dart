
import 'package:circlet/components/components.dart';
import 'package:circlet/screen/login_register/id_search_page.dart';
import 'package:circlet/screen/login_register/password_search_page.dart';
import 'package:circlet/screen/login_register/register_page1.dart';
import 'package:circlet/screen/main/study_search_page.dart';
import 'package:circlet/util/color.dart';
import 'package:circlet/util/font/font.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text('DevLinkUp', style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter'
            ),),),

          const SizedBox(
            height: 50,
          ),
          Text('이메일', style: f15bw500,),
          const SizedBox(
            height: 6,
          ),
          TextFormBox(
              hintText: '이메일을 입력하세요',
              textController: emailController,
              onTap: (){},
              onChange: (v){
                setState(() {
                });
              }),
          const SizedBox(
            height: 10,
          ),
          Text('비밀번호', style: f15bw500,),
          const SizedBox(
            height: 6,
          ),
          suffixTextFormBox(
            hintText: '비번번호를 입력하세요',
            textController: passwordController,
            onTap: (){},
            isIcon: true,
            visible: passwordVisible,
            onpressed: (){
              print('11');
              passwordVisible = !passwordVisible;
              setState(() {});
            },
            onChange: (v){
              setState(() {

              });
            },
            isContainer: true,
            textStyle: f14w300,
            backgroundColor: mainColor,
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                Get.to(StudySearchPage());

              });
            },
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                  color: Color(0xff000000),
                  borderRadius: BorderRadius.circular(5),

              ),
              child: Center(
                child: Text(
                  '로그인',
                  style: f24w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                Get.to(RegisterPage1());

              });
            },
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                  color: Color(0xfffffff),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: blackColor,
                    width: 1,
              )
              ),
              child: Center( // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
                child: Text(
                  '회원가입', style: f24bw500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Divider(
                    color: Color(0xff909090),
                  ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '간편로그인',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff909090),
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Color(0xff909090),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 50,right: 50),
            child: Row(
              children: [
                ImageButton(image: 'assets/image/naver.svg', ontap: (){
                  print('1111');
                },),
                Spacer(),
                ImageButton(image: 'assets/image/kakao.svg', ontap: (){
                  print('1111');
                },),
                Spacer(),
                ImageButton(image: 'assets/image/google.svg', ontap: (){
                  print('1111');
                },),
                Spacer(),
                ImageButton(image: 'assets/image/appleLogin.svg', ontap: (){
                  print('1111');
                },),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Get.to(IdSearchPage());
                  setState(() {

                  });
                },
                child: Text('아이디 찾기',style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'NotoSans',color: Color(0xff1F2D37)
                ),),
              ),
              Text(' | '),
              GestureDetector(
                onTap: (){
                  Get.to(PasswordSearchPage());
                  setState(() {

                  });
                },
                child: Text('비밀번호 찾기',style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'NotoSans',color: Color(0xff1F2D37)
                ),),
              ),
            ],
          )
        ],
        ),
      ),
    );
  }
}
