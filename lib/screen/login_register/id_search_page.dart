
import 'package:circlet/components/components.dart';
import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';


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
              Text('가입시 입력한 휴대폰 번호',
              style: f17bw500,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                          color: Color(0xffEBEBEB)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Color(0xff3648EB))
                    ),
                    contentPadding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                    hintText: '휴대전화 (-없이)',
                    hintStyle: f14w300HintGray,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12,right: 12,top: 9,bottom: 9),
                      child: GestureDetector(
                        onTap: (){
                          print('1111');
                        },
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                              color: Color(0xffF3F3F3),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(child: Text('인증요청')),
                        ),
                      ),
                    ),
                ),
                style: TextStyle(
                  color: Color(0xff6E6E6E),
                ),
                controller: phoneController,

                onChanged: (v){
                  setState(() {
                  });
                },
              ),
              const SizedBox(height: 10,),
            TextFormBox(
                hintText: '인증번호를 입력해 주세요.',
                textController: certController,
                onTap: (){},
                onTap2: (v){
                  setState(() {
                    certCheck = certController.text == checkNum? true : false;
                  });
                }),
              Text('*본인명의 핸드폰번호를 정확히 입력해 주시기 바랍니다.',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffABABAB),
              ),),
              Spacer(),
              GestureDetector(
                onTap: (){
                  setState(() {

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
                      '아이디 찾기',
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
