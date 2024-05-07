import 'package:circlet/screen/login_register/password_reset_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/components.dart';
import '../../util/font/font.dart';

class PasswordSearchPage extends StatefulWidget {
  const PasswordSearchPage({super.key});

  @override
  State<PasswordSearchPage> createState() => _PasswordSearchPageState();
}

class _PasswordSearchPageState extends State<PasswordSearchPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController certController = TextEditingController();
  bool certCheck = false;
  String checkNum = '1234';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('비밀번호 찾기',
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
          padding: const EdgeInsets.only(top: 20, left: 12, right: 12,bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('이메일',
                style: f17bw500,
              ),
              const SizedBox(height: 16,),
              TextFormBox(hintText: '이메일을 입력해주세요',
                  textController: emailController,
                  onTap: (){},
                  onChange: (v){
                    setState(() {
                    });
                  }),
              const SizedBox(
                height: 43,
              ),
              Text('가입시 입력한 핸드폰번호',
                style: f17bw500,
              ),
              const SizedBox(height: 16,),
              suffixTextFormBox(
                hintText: '휴대전화(-없이)',
                textController: phoneController,
                onTap: (){},
                onChange: (v){
                  setState(() {
                  });
                },
                isContainer: true,
                containerText: '인증요청',
                textStyle: f14bw300,
                backgroundColor: Color(0xffF3F3F3),
              ),
              const SizedBox(height: 15,),
              TextFormBox(hintText: '인증번호를 입력해주세요',
                  textController: certController,
                  onTap: (){},
                  onChange: (v){
                    setState(() {
                      certCheck = certController.text == checkNum? true : false;
                    });
                  }),
              const SizedBox(height: 9,),
              Text('*본인명의 핸드폰번호를 정확히 입력해 주시기 바랍니다.',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffABABAB),
                ),),
              Spacer(),
              GestureDetector(
                onTap: (){
                  Get.to(PasswordResetPage());
                  setState(() {
                    certCheck == false? '': '';

                  });

                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: certCheck == true? Color(0xff3648EB):Color(0xffEBEBEB),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center( // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
                    child: Text(
                      '비밀번호 찾기',
                      style: TextStyle(
                          color: certCheck == true? Color(0xffFFFFFF):Color(0xffABABAB)
                          ,fontSize: 18),
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
}
