
import 'package:circlet/components/components.dart';
import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../dialog/dialog.dart';


class IdSearchPage extends StatefulWidget {
  const IdSearchPage({super.key});

  @override
  State<IdSearchPage> createState() => _IdSearchPageState();
}

class _IdSearchPageState extends State<IdSearchPage> {
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
          title: Text('아이디 찾기',
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
              Text('핸드폰 인증',
                style: f17bw500,
              ),
              const SizedBox(height: 17,),
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
                  setState(() {
                    certCheck == false? '': showOnlyConfirmTapDialog(context, '아이디 찾기', () { });

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
                      '다음',
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
        // bottomSheet:  Expanded(
        //   child: GestureDetector(
        //     onTap: (){
        //       setState(() {
        //
        //       });
        //
        //     },
        //     child: Container(
        //       height: 60,
        //       decoration: BoxDecoration(
        //           color: certCheck == true? Color(0xff3648EB):Color(0xffEBEBEB),
        //           borderRadius: BorderRadius.circular(5)
        //       ),
        //       child: Center( // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
        //         child: Text(
        //           '아이디 찾기',
        //           style: TextStyle(
        //               color: certCheck == true? Color(0xffFFFFFF):Color(0xffABABAB)
        //               ,fontSize: 18),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
