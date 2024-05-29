import 'dart:async';

import 'package:circlet/components/components.dart';
import 'package:circlet/screen/login_register/register/register_page.dart';
import 'package:circlet/util/color.dart';
import 'package:circlet/util/font/font.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../dialog/dialog.dart';
import '../login/login_page.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;
  bool _phoneAuth = false;
  late Timer _timer;
  int _start = 0;
  bool _isCodeSent = false;
  bool _isPhoneUnique = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _start = 120; // 인증 유효 시간 120초
    _timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel();
          print(_timer.isActive);
        });
      } else {
        _start--;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '핸드폰 인증',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
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
          padding:
              const EdgeInsets.only(top: 13, left: 13, right: 13, bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '핸드폰 인증',
                style: f17bw500,
              ),
              const SizedBox(
                height: 17,
              ),
              suffixTextFormBox(
                hintText: '핸드폰 번호를 입력해주세요',
                textController: _phoneController,
                keyboardType: TextInputType.phone,
                onTap: () {
                  _verifyPhoneNumber();
                },
                onChange: (v) {
                  setState(() {});
                },
                isContainer: true,
                containerText: '인증요청',
                textStyle: f14bw300,
                backgroundColor: Color(0xffF3F3F3),
              ),
              const SizedBox(
                height: 15,
              ),
              suffixTextFormBox(
                hintText: '인증번호 6자리를 입력해주세요',
                textController: _otpController,
                onTap: () {},
                onChange: (v) {},
                suffixText: _isCodeSent ? '$_start 초' : '',
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                '* 본인명의 핸드폰번호를 정확히 입력해 주시기 바랍니다.',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffABABAB),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  _isCodeSent
                      ? _signInWithPhoneNumber()
                      : showOnlyConfirmDialog(
                          context, '핸드폰 인증', "인증요청을 눌러주세요.");
                  setState(() {
                    //certCheck == false? '': Get.to(RegisterPage2());
                  });
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: _isCodeSent == true
                          ? Color(0xff3648EB)
                          : Color(0xffEBEBEB),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
                    child: Text(
                      '인증확인',
                      style: TextStyle(
                          color: _isCodeSent == true
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
      ),
    );
  }

  /// 전화번호를 국제 형식으로 변환하는 함수, 예: '01012345678' -> '+82 1012345678'
  String _formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('0')) {
      return phoneNumber.replaceFirst('0', '+82 ');
    }
    return phoneNumber;
  }

  /// 사용자 입력 전화번호 중복여부를 검사한 후 중복이 없으면 파이어베이스 인증을 시작하는 함수
  void _verifyPhoneNumber() async {
    // 사용자 입력 전화번호 포멧팅
    String formattedPhoneNumber = _formatPhoneNumber(_phoneController.text);
    // 중복검사를 통해 유니크한 전화번호인지 확인
    _isPhoneUnique = await firebasePhoneDuplicate(formattedPhoneNumber)== false;

    if(_isPhoneUnique) {
      await _auth.verifyPhoneNumber(
        phoneNumber: formattedPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        // 잘못된 전화번호, SMS할당량 초과시 실패 이벤트
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
            _isCodeSent = true;
          });
          startTimer();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
      );
      // 중복된 전화번호 일 경우
    }else{
      showOnlyConfirmDialog(context, '중복된 번호', "이미 가입된 번호입니다.");

    }
  }

  ///파이어베이스에서 중복된 전화번호를 찾는 함수
  ///중복된 번호가 존재 할 경우 true, 존재 하지 않을 경우 false 반환
  Future<bool> firebasePhoneDuplicate(String phoneNumber) async{
  CollectionReference ref = FirebaseFirestore.instance.collection('userInfo');
  try {
    QuerySnapshot snapshot = await ref.where('phone', isEqualTo: phoneNumber).get();
    if (snapshot.docs.isNotEmpty) {
      return true; // 중복된 전화번호가 존재함
    } else {
      return false; // 중복된 전화번호가 존재하지 않음
    }
  } catch (e) {
    print("Error checking phone number: $e");
    return true;
  }
}

  void _signInWithPhoneNumber() async {
    if (_timer.isActive) {
      try {
        final credential = PhoneAuthProvider.credential(
          verificationId: _verificationId,
          smsCode: _otpController.text,
        );
        final authCredential = await _auth.signInWithCredential(credential);
        if (authCredential.user != null) {
          setState(() {
            _phoneAuth = true;
            _isCodeSent = false;
            showOnlyConfirmTapDialog(context, '인증완료', "인증이 완료되었습니다.", () {
              Get.to(() => RegisterPage())?.then((value) {
                Get.back();
                _start = 0;
                _phoneController.clear();
                _otpController.clear();
                _timer.cancel();
              });
            });
          });
          await _auth.currentUser!.delete();
          _auth.signOut();
        }
      } on FirebaseAuthException catch (e) {
        // 인증이 실패한 경우
        Get.back();
        setState(() {
          _phoneAuth = false;
        });
        showOnlyConfirmDialog(context, '인증번호', "인증번호가 일치하지 않습니다.");
        print('Error Log Phone Auth : ${e.message}');
      }
    } else {
      showOnlyConfirmDialog(context, '인증번호', "인증번호의 유효시간이 종료되었습니다.");
    }
  }
}
