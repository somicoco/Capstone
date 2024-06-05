import 'package:circlet/components/components.dart';
import 'package:circlet/dialog/dialog.dart';
import 'package:circlet/provider/user_state.dart';
import 'package:circlet/screen/login_register/Interest_page.dart';
import 'package:circlet/screen/main/bottom_navigator.dart';
import 'package:circlet/util/color.dart';
import 'package:circlet/util/font/font.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../firebase/firebase_user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final us = Get.put(UserState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkPasswordController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  String validatePasswordText = '*비밀번호는 8~32 자의 영문, 숫자, 특수문자를 조합하여 설정해 주세요.';
  // String validateEmailText = '';
  // String validateNicknameText = '';

  ///유효성 검사 여부
  bool emailValid = false;
  bool passwordValid = false;
  bool nicknameValid = false;

  bool emailEnable = false;
  bool nicknameEnable = false;

  bool visible = false;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(text: '회원가입',),
      body: Padding(
        padding:
        const EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '이메일',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            suffixTextFormBox(
              hintText: '이메일을 입력해주세요',
              textController: emailController,
              enabled: !emailEnable,
              onTap: () async {
                await validateEmail(emailController.text);
                if (emailValid && emailEnable == false) {
                  await registerEmailDuplicate(emailController.text);
                  us.memberCheckEmail.value == '1' ?
                  showConfirmTapDialog(
                      context, '이미 사용 중인 이메일입니다.', () {
                    Get.back();
                    emailEnable = false;
                  })
                      : showConfirmTapDialog(
                      context, '사용 가능한 이메일입니다.', () {
                    Get.back();
                    emailEnable = true;
                    setState(() {
                    });
                  });
                }else{
                  showConfirmTapDialog(context, '이메일을 수정할 수 있습니다.', (){
                    Get.back();
                    emailEnable = false;
                    setState(() {

                    });
                  });
                }
              },
              onChange: (v) {
                setState(() {
                });
              },
              isContainer: true,
              containerText: emailEnable ? '수정하기' : '중복체크',
              textStyle: f14w400,
              backgroundColor: mainColor,
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              '비밀번호',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            TextFormBox(
                hintText: '비밀번호를 입력해주세요.',
                textController: passwordController,
                onTap: () {},
                onChange: (v) {
                  passwordValid = validatePassword(v)
                      ? checkPasswordController.text ==
                      passwordController.text
                      ? true
                      : false
                      : false;
                  setState(() {
                    validatePasswordText = passwordValid
                        ? '사용가능한 비밀번호 입니다.'
                        : '*비밀번호는 8~32 자의 영문, 숫자, 특수문자를 조합하여 설정해 주세요.';
                  });
                }),
            const SizedBox(
              height: 13,
            ),
            Text(
              '비밀번호 확인',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            TextFormBox(
                hintText: '비밀번호를 입력해주세요.',
                textController: checkPasswordController,
                onTap: () {},
                onChange: (v) {
                  passwordValid = validatePassword(v)
                      ? checkPasswordController.text ==
                      passwordController.text
                      ? true
                      : false
                      : false;
                  setState(() {
                    validatePasswordText = passwordValid
                        ? '사용가능한 비밀번호 입니다.'
                        : '*비밀번호는 8~32 자의 영문, 숫자, 특수문자를 조합하여 설정해 주세요.';
                  });
                }),
            const SizedBox(
              height: 8,
            ),
            Text(
              validatePasswordText,
              style: TextStyle(
                  fontSize: 12,
                  color: passwordValid
                      ? Color(0xff0DD675)
                      : Color(0xffABABAB)),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              '닉네임',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            suffixTextFormBox(
              hintText: '2~8자 이내로 닉네임을 입력해주세요',
              textController: nickNameController,
              enabled: !nicknameEnable,
              onTap: () async {
                await validateNickname(nickNameController.text);
                if (nicknameValid && nicknameEnable == false) {
                  await registerNicknameDuplicate(nickNameController.text);
                  us.memberCheckNickname.value == '1' ?
                  showOnlyConfirmTapDialog(
                      context, '중복된 닉네임', '이미 사용 중인 닉네임입니다.', () {
                    Get.back();
                    nicknameEnable = false;
                  })
                      : showOnlyConfirmTapDialog(
                      context, '닉네임 확인', '사용가능한 닉네임입니다.', () {
                    Get.back();
                    nicknameEnable = true;
                    setState(() {
                    });
                  });
                }else{
                  showConfirmTapDialog(context, '닉네임을 수정할 수 있습니다.', (){
                    Get.back();
                    nicknameEnable = false;
                    setState(() {

                    });
                  });
                }
              },
              onChange: (v) {
                setState(() {
                });
              },
              isContainer: true,
              containerText: nicknameEnable ? '수정하기' : '중복체크',
              textStyle: f14w400,
              backgroundColor: mainColor,
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                us.memberCheckEmail == '0'&&us.memberCheckNickname == '0'&&passwordValid
                    ? await firebaseRegister().then(showOnlyConfirmTapDialog(
                    context, '회원가입', '회원가입이 완료되었습니다.', () {
                  Get.to(() => InterestPage());
                }))
                    : showConfirmTapDialog(context, '회원가입에 실패했습니다.', () {Get.back(); });
                setState(() {});
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color:
                    us.memberCheckEmail == '0'&&us.memberCheckNickname == '0'&&passwordValid
                        ? Color(0xff3648EB)
                        : Color(0xffEBEBEB),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                        color:
                        us.memberCheckEmail == '0'&&us.memberCheckNickname == '0'&&passwordValid
                            ? Color(0xffFFFFFF)
                            : Color(0xffABABAB),
                        fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Future<void> firebaseRegister() async {
    us.registerPassword.value = passwordController.text;
    CollectionReference ref = FirebaseFirestore.instance.collection('user');

    try {
      await ref.add({
        'email': us.registerEmail.value,
        'docId': '',
        'password': us.registerPassword.value,
        'nickname': us.registerNickname.value,
        'phone': us.registerPhone.value,
        'createDate': '${DateTime.now()}',
      })
          .then((doc) async {
            DocumentReference userDocRef = FirebaseFirestore.instance.collection('user').doc(doc.id);
        await userDocRef.update({'docId':'${doc.id}'});
        us.userDocId.value = doc.id;
        print('doc id???');
        print(us.userDocId.value);
      });
    } catch (e) {
      print('Error adding document: $e');
    }
  }

  ///이메일 유효성 검사
  bool validateEmail(String value) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';

    RegExp regExp = RegExp(pattern);
    return (regExp.hasMatch(value)) ? emailValid = true : emailValid = false;
  }

  /// 비밀번호 유효성검사 8자리 이상 32자리 이하 특수문자 포함
  bool validatePassword(String password) {
    // 비밀번호 유효성 검사에 사용할 정규식
    String pattern = r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,32}$';

    RegExp regExp = RegExp(pattern);
    return (regExp.hasMatch(password)) ? passwordValid = true : passwordValid =
    false;
  }

  ///닉네임 유효성 검사 2자리 이상 8자리 이하
  bool validateNickname(String nickname) {
    int minLength = 2;
    int maxLength = 8;
    return (nickname.length >= minLength && nickname.length <= maxLength) ?
    nicknameValid = true : nicknameValid = false;
  }
}
