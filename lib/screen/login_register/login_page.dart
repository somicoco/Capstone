
import 'package:circlet/components/components.dart';
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
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
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
          Text('회원가입', style: f15bw500,),
          Container(
            height: 55,
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Color(0xff282828)
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Color(0xff3648EB))
                ),
                hintText: '아이디를 입력해 주세요.',
                hintStyle: f14w300HintGray,
              ),
              style: TextStyle(
                  color: Colors.black,
              ),
              controller: idController,
              onChanged: (v){
                setState(() {
                });
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text('비밀번호', style: f15bw500,),
          Container(
            height: 55,
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                        color: Color(0xff1F2D37)
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Color(0xff3648EB))
                  ),
                  hintText: '비밀번호를 입력해 주세요.',
                  hintStyle: f14w300HintGray,
              ),
              style: TextStyle(
                  color: Colors.black
              ),
              controller: passwordController,
              onChanged: (v){
                setState(() {
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
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
            height: 18,
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
            height: 30,
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
                  'sns로 1초만에 로그인',
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
          Center(
            child: GestureDetector(
              onTap: (){
                setState(() {

                });
              },
              child: Text('아이디/비밀번호 찾기',style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold
              ),),
            ),
          )
        ],
        ),
      ),
    );
  }
}
