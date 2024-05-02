import 'package:circlet/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'login_page.dart';

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
  String validatePasswordText = '*8자이상이면서 최소한 특수기호 하나를 포함해야합니다.'; ///비밀번호 유효성 검사 Text
  String validateEmailText = ''; ///이메일 유효성 검사 Text
  String validateNicknameText = ''; ///닉네임 유효성 검사 Text

  bool isEmailValid = false; ///이메일 유효성 검사 여부
  bool isPasswordValid = false;///비밀번호 유효성 검사 여부
  bool isNicknameValid = false;///닉네임 유효성 검사 여부
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입',
          style: TextStyle(
            fontSize: 22,
          ),),
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
            TextFormBox(hintText: '이메일을 입력해주세요.',
                textController: emailController,
                onTap: (){},
                onTap2: (v){
                  isEmailValid = validateEmail(v);
                  setState(() {
                    validateEmailText = isEmailValid? '사용가능한 이메일 입니다.': emailController.text == '' ? '':'올바른 이메일 형식으로 입력해주세요.';
                  });
                }),
            Text('$validateEmailText', style: TextStyle(fontSize: 12, color: isEmailValid?Color(0xff0DD675):Colors.red),),
            Text('비밀번호', style: TextStyle(fontSize: 17,),),
            TextFormBox(hintText: '비밀번호를 입력해주세요.',
                textController: passwordController,
                onTap: (){},
                onTap2: (v){
                  isPasswordValid = validatePassword(v)?checkPasswordController.text==passwordController.text?true:false:false;
                  setState(() {
                    validatePasswordText = isPasswordValid?'사용가능한 비밀번호 입니다.': '*8자이상이면서 최소한 특수기호 하나를 포함해야합니다.';
                  });
                }),
            Text('비밀번호 확인', style: TextStyle(fontSize: 17,),),
            TextFormBox(hintText: '비밀번호를 입력해주세요.',
                textController: checkPasswordController,
                onTap: (){},
                onTap2: (v){
                  isPasswordValid = validatePassword(v)?checkPasswordController.text==passwordController.text?true:false:false;
                  setState(() {
                    validatePasswordText = isPasswordValid?'사용가능한 비밀번호 입니다.': '*8자이상이면서 최소한 특수기호 하나를 포함해야합니다.';
                  });
                }),
            Text(validatePasswordText, style: TextStyle(fontSize: 12,color: isPasswordValid?Color(0xff0DD675):Color(0xffABABAB)),),
            Text('닉네임', style: TextStyle(fontSize: 17,),),
            TextFormBox(hintText: '닉네임을 입력해주세요.',
                textController: nickNameController,
                onTap: (){},
                onTap2: (v){
                  isNicknameValid = validateNickname(v);
                  setState(() {
                    validateNicknameText = isNicknameValid? '사용가능한 닉네임 입니다.': nickNameController.text == '' ? '':'닉네임은 2글자 이상이면서 8글자여야합니다.';
                  });
                }),
            Text(validateNicknameText, style: TextStyle(fontSize: 12,color: isNicknameValid?Color(0xff0DD675):Color(0xffABABAB)),),
            Spacer(),
            GestureDetector(
              onTap: (){
                setState(() {
                  isNicknameValid&&isPasswordValid&&isEmailValid? '': Get.to(LoginPage());

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
                    '다음',
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

/// 비밀번호 유효성검사 8자리 이상 15자리 이하 특수문자 포함
bool validatePassword(String password) {
  // 비밀번호 유효성 검사에 사용할 정규식
  String pattern = r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,15}$';

  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(password);
}
///닉네임 유효성 검사 2자리 이상 8자리 이하
bool validateNickname(String nickname) {
  int minLength = 2;
  int maxLength = 8;

  return nickname.length >= minLength && nickname.length <= maxLength;
}


