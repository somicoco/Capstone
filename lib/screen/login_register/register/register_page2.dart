import 'package:circlet/components/components.dart';
import 'package:circlet/screen/login_register/Interest_page.dart';
import 'package:circlet/util/color.dart';
import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../login/login_page.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkPasswordController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  String validatePasswordText = '*비밀번호는 8~32 자의 영문, 숫자, 특수문자를 조합하여 설정해 주세요.'; ///비밀번호 유효성 검사 Text
  String validateEmailText = ''; ///이메일 유효성 검사 Text
  String validateNicknameText = ''; ///닉네임 유효성 검사 Text

  bool isEmailValid = false; ///이메일 유효성 검사 여부
  bool isPasswordValid = false;///비밀번호 유효성 검사 여부
  bool isNicknameValid = false;///닉네임 유효성 검사 여부

  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입',
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
        padding: const EdgeInsets.only(top: 10, left: 12, right: 12,bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('이메일', style: TextStyle(fontSize: 17,),),
            suffixTextFormBox(
              hintText: '이메일을 입력해주세요',
              textController: emailController,
              onTap: (){print(isEmailValid);},
              onChange: (v){
                isEmailValid = validateEmail(v);
                setState(() {
                  validateEmailText = isEmailValid?'':'이메일 형식으로 입력해주세요.';

                });
              },
              isContainer: true,
              containerText: '중복체크',
              textStyle: f14w300,
              backgroundColor: mainColor,
            ),
            Text(validateEmailText, style: TextStyle(fontSize: 12, color: isEmailValid?Color(0xff0DD675):Colors.red),),
            Text('비밀번호', style: TextStyle(fontSize: 17,),),
            TextFormBox(hintText: '비밀번호를 입력해주세요.',
                textController: passwordController,
                onTap: (){},
                onChange: (v){
                  isPasswordValid = validatePassword(v)?checkPasswordController.text==passwordController.text?true:false:false;
                  setState(() {
                    validatePasswordText = isPasswordValid?'사용가능한 비밀번호 입니다.': '*비밀번호는 8~32 자의 영문, 숫자, 특수문자를 조합하여 설정해 주세요.';
                  });
                }),
            const SizedBox(
              height: 13,
            ),
            Text('비밀번호 확인', style: TextStyle(fontSize: 17,),),
            TextFormBox(hintText: '비밀번호를 입력해주세요.',
                textController: checkPasswordController,
                onTap: (){},
                onChange: (v){
                  isPasswordValid = validatePassword(v)?checkPasswordController.text==passwordController.text?true:false:false;
                  setState(() {
                    validatePasswordText = isPasswordValid?'사용가능한 비밀번호 입니다.': '*비밀번호는 8~32 자의 영문, 숫자, 특수문자를 조합하여 설정해 주세요.';
                  });
                }),
            const SizedBox(
              height: 8,
            ),
            Text(validatePasswordText, style: TextStyle(fontSize: 12,color: isPasswordValid?Color(0xff0DD675):Color(0xffABABAB)),),
            const SizedBox(
              height: 13,
            ),
            Text('닉네임', style: TextStyle(fontSize: 17,),),
            suffixTextFormBox(
              hintText: '닉네임을 입력해주세요',
              textController: nickNameController,
              onTap: (){print(isNicknameValid);},
              onChange: (v){
                isNicknameValid = validateNickname(v);
                setState(() {
                  validateNicknameText = isNicknameValid?'':'닉네임은 2자이상 8자이하의 형식으로 입력해주세요.';

                });
              },
              isContainer: true,
              containerText: '중복체크',
              textStyle: f14w300,
              backgroundColor: mainColor,
            ),
            Text(validateNicknameText, style: TextStyle(fontSize: 12,color: isNicknameValid?Color(0xff0DD675):Color(0xffABABAB)),),



            Spacer(),
            GestureDetector(
              onTap: (){
                setState(() {
                  isNicknameValid&&isPasswordValid&&isEmailValid? '': Get.to(InterestPage());

                });

              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: isNicknameValid&&isPasswordValid&&isEmailValid? Color(0xff3648EB):Color(0xffEBEBEB),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center( // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                        color: isNicknameValid&&isPasswordValid&&isEmailValid? Color(0xffFFFFFF):Color(0xffABABAB)
                        ,fontSize: 18),
                  ),
                ),
              ),
            )


          ],
        ),

      )
      ,


    );
  }
}

///이메일 유효성 검사
bool validateEmail(String value) {
  String pattern =
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';

  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

/// 비밀번호 유효성검사 8자리 이상 32자리 이하 특수문자 포함
bool validatePassword(String password) {
  // 비밀번호 유효성 검사에 사용할 정규식
  String pattern = r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,32}$';

  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(password);
}
///닉네임 유효성 검사 2자리 이상 8자리 이하
bool validateNickname(String nickname) {
  int minLength = 2;
  int maxLength = 8;

  return nickname.length >= minLength && nickname.length <= maxLength;
}


