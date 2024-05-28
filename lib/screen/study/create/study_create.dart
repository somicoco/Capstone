import 'package:circlet/util/color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/components.dart';
import '../../../util/font/font.dart';

class StudyCreate extends StatefulWidget {
  const StudyCreate({super.key});

  @override
  State<StudyCreate> createState() => _StudyCreateState();
}

class _StudyCreateState extends State<StudyCreate> {

  TextEditingController studyNameController = TextEditingController();
  TextEditingController studyContentController = TextEditingController();
  TextEditingController techStackController = TextEditingController();
  List techList = [];
  String validateStudyNameText = ''; ///스터디 유효성 검사 Text
  bool isStudyNameValid = false;///스터디 이름 유효성 검사 여부
  List<String> dropdownList = ['대전광역시', '경기도',];
  String? selectedDropdown;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스터디 개설',
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
        padding: EdgeInsets.only(top: 10,left: 12,right: 12),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('활동지역', style: f17bw500,),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1, color: grayColor
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 7),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          iconStyleData: IconStyleData(
                            icon: SvgPicture.asset(
                              'assets/icon/dropdown.svg'
                            ),
                            iconSize: 20
                          ),
                          value: selectedDropdown,
                          hint: Text(
                            '시',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black, // blackColor를 적절한 색으로 대체하세요.
                              fontFamily: 'NotoSans',
                            ),
                          ),
                          items: dropdownList.map((String item) {
                            return DropdownMenuItem<String>(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 14, color: blackColor, fontFamily: 'NotoSans'
                                ),
                              ),
                              value: item,
                            );
                          }).toList(),
                          onChanged: (dynamic value) {
                            setState(() {
                              selectedDropdown = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 1, color: grayColor
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 7),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          iconStyleData: IconStyleData(
                              icon: SvgPicture.asset(
                                  'assets/icon/dropdown.svg'
                              ),
                              iconSize: 20
                          ),
                          value: selectedDropdown,
                          items: dropdownList.map((String item) {
                            return DropdownMenuItem<String>(
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 14, color: blackColor, fontFamily: 'NotoSans'
                                ),
                              ),
                              value: item,
                            );
                          }).toList(),
                          onChanged: (dynamic value) {
                            setState(() {
                              selectedDropdown = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text('스터디 소개', style: f17bw500,),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 63,
                height: 59,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5, color: lightGrayColor
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24,
                      child: SvgPicture.asset('assets/icon/camera.svg'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '사진추가', style: f9bw500,
                    ),


                  ],
                )
              ),
              SizedBox(
                height: 5,
              ),
              suffixTextFormBox(
                hintText: '스터디명을 입력해주세요',
                textController: studyNameController,
                onTap: (){print(isStudyNameValid);},
                onChange: (v){
                  isStudyNameValid = validateStudyName(v);
                  setState(() {
                    validateStudyNameText = isStudyNameValid?'사용가능한 스터디 이름입니다.':'스터디 이름은 2자이상 40자이하의 형식으로 입력해주세요.';

                  });
                },
                isContainer: true,
                containerText: '중복체크',
                textStyle: f14w300,
                backgroundColor: mainColor,
              ),
              Text(validateStudyNameText, style: TextStyle(fontSize: 12,color: isStudyNameValid?greenColor:hintGrayColor),),
              SizedBox(
                height: 100,
                child: TextFormBox(
                    hintText: '스터디를 소개할 수 있는 글을 작성해주세요.' ,
                    textController: studyContentController,
                    onTap: (){},
                    onChange: (v){},
                    multiline: 'true',),

              ),
              const SizedBox(height: 29,),
              Row(
                children: [
                  Container(
                    width: Get.width*0.75,
                    height: 45,
                    child: TextFormBox(
                        hintText: 'ex) Javascript',
                        textController: techStackController,
                        onTap: (){},
                        onChange: (v){}),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      techList.add(techStackController.text);
                      techStackController.clear();
                      print(techList);
                      setState(() {

                      });
                    },
                    child: Container(
                      width: Get.width*0.17,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: darkGrayColor,
                      ),
                      child: Center( // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
                        child: Text(
                          '등록',
                          style: f16w500,
                        ),
                      ),
                    ),
                  )

                ],
              ),
              const SizedBox(
                height: 26,
              ),
              Text('등록한 기술스텍', style: f14bw300,),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 5, // 좌우 간격
                runSpacing: 5, // 상하 간격
                children: techList.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final String tech = entry.value;
                  return Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 7,right: 30,top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: darkGrayColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          tech,
                          style: f16w300,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 6,
                        child: GestureDetector(
                          onTap: () {
                            // 해당 요소를 리스트에서 삭제
                            setState(() {
                              techList.removeAt(index);
                            });

                          },
                          child: Container(
                            child: Icon(Icons.close, color: Colors.white,size: 20,),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: (){
                  //Get.to(()=>);
                  setState(() {

                  });

                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xff3648EB),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center( // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
                    child: Text(
                      '개설하기',
                      style: TextStyle(
                          color: Color(0xffFFFFFF)
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
///닉네임 유효성 검사 2자리 이상 40자리 이하
bool validateStudyName(String studyName) {
  int minLength = 2;
  int maxLength = 40;

  return studyName.length >= minLength && studyName.length <= maxLength;
}
